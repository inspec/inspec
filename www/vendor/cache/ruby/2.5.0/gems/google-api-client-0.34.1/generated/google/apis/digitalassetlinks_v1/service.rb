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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module DigitalassetlinksV1
      # Digital Asset Links API
      #
      # Discovers relationships between online assets such as websites or mobile apps.
      #
      # @example
      #    require 'google/apis/digitalassetlinks_v1'
      #
      #    Digitalassetlinks = Google::Apis::DigitalassetlinksV1 # Alias the module
      #    service = Digitalassetlinks::DigitalassetlinksService.new
      #
      # @see https://developers.google.com/digital-asset-links/
      class DigitalassetlinksService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://digitalassetlinks.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Determines whether the specified (directional) relationship exists between
        # the specified source and target assets.
        # The relation describes the intent of the link between the two assets as
        # claimed by the source asset.  An example for such relationships is the
        # delegation of privileges or permissions.
        # This command is most often used by infrastructure systems to check
        # preconditions for an action.  For example, a client may want to know if it
        # is OK to send a web URL to a particular mobile app instead. The client can
        # check for the relevant asset link from the website to the mobile app to
        # decide if the operation should be allowed.
        # A note about security: if you specify a secure asset as the source, such as
        # an HTTPS website or an Android app, the API will ensure that any
        # statements used to generate the response have been made in a secure way by
        # the owner of that asset.  Conversely, if the source asset is an insecure
        # HTTP website (that is, the URL starts with `http://` instead of
        # `https://`), the API cannot verify its statements securely, and it is not
        # possible to ensure that the website's statements have not been altered by a
        # third party.  For more information, see the [Digital Asset Links technical
        # design
        # specification](https://github.com/google/digitalassetlinks/blob/master/well-
        # known/details.md).
        # @param [String] relation
        #   Query string for the relation.
        #   We identify relations with strings of the format `<kind>/<detail>`, where
        #   `<kind>` must be one of a set of pre-defined purpose categories, and
        #   `<detail>` is a free-form lowercase alphanumeric string that describes the
        #   specific use case of the statement.
        #   Refer to [our API documentation](/digital-asset-links/v1/relation-strings)
        #   for the current list of supported relations.
        #   For a query to match an asset link, both the query's and the asset link's
        #   relation strings must match exactly.
        #   Example: A query with relation `delegate_permission/common.handle_all_urls`
        #   matches an asset link with relation
        #   `delegate_permission/common.handle_all_urls`.
        # @param [String] source_android_app_certificate_sha256_fingerprint
        #   The uppercase SHA-265 fingerprint of the certificate.  From the PEM
        #   certificate, it can be acquired like this:
        #   $ keytool -printcert -file $CERTFILE | grep SHA256:
        #   SHA256: 14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83: \
        #   42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   or like this:
        #   $ openssl x509 -in $CERTFILE -noout -fingerprint -sha256
        #   SHA256 Fingerprint=14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64: \
        #   16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   In this example, the contents of this field would be `14:6D:E9:83:C5:73:
        #   06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:
        #   44:E5`.
        #   If these tools are not available to you, you can convert the PEM
        #   certificate into the DER format, compute the SHA-256 hash of that string
        #   and represent the result as a hexstring (that is, uppercase hexadecimal
        #   representations of each octet, separated by colons).
        # @param [String] source_android_app_package_name
        #   Android App assets are naturally identified by their Java package name.
        #   For example, the Google Maps app uses the package name
        #   `com.google.android.apps.maps`.
        #   REQUIRED
        # @param [String] source_web_site
        #   Web assets are identified by a URL that contains only the scheme, hostname
        #   and port parts.  The format is
        #   http[s]://<hostname>[:<port>]
        #   Hostnames must be fully qualified: they must end in a single period
        #   ("`.`").
        #   Only the schemes "http" and "https" are currently allowed.
        #   Port numbers are given as a decimal number, and they must be omitted if the
        #   standard port numbers are used: 80 for http and 443 for https.
        #   We call this limited URL the "site".  All URLs that share the same scheme,
        #   hostname and port are considered to be a part of the site and thus belong
        #   to the web asset.
        #   Example: the asset with the site `https://www.google.com` contains all
        #   these URLs:
        #   *   `https://www.google.com/`
        #   *   `https://www.google.com:443/`
        #   *   `https://www.google.com/foo`
        #   *   `https://www.google.com/foo?bar`
        #   *   `https://www.google.com/foo#bar`
        #   *   `https://user@password:www.google.com/`
        #   But it does not contain these URLs:
        #   *   `http://www.google.com/`       (wrong scheme)
        #   *   `https://google.com/`          (hostname does not match)
        #   *   `https://www.google.com:444/`  (port does not match)
        #   REQUIRED
        # @param [String] target_android_app_certificate_sha256_fingerprint
        #   The uppercase SHA-265 fingerprint of the certificate.  From the PEM
        #   certificate, it can be acquired like this:
        #   $ keytool -printcert -file $CERTFILE | grep SHA256:
        #   SHA256: 14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83: \
        #   42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   or like this:
        #   $ openssl x509 -in $CERTFILE -noout -fingerprint -sha256
        #   SHA256 Fingerprint=14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64: \
        #   16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   In this example, the contents of this field would be `14:6D:E9:83:C5:73:
        #   06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:
        #   44:E5`.
        #   If these tools are not available to you, you can convert the PEM
        #   certificate into the DER format, compute the SHA-256 hash of that string
        #   and represent the result as a hexstring (that is, uppercase hexadecimal
        #   representations of each octet, separated by colons).
        # @param [String] target_android_app_package_name
        #   Android App assets are naturally identified by their Java package name.
        #   For example, the Google Maps app uses the package name
        #   `com.google.android.apps.maps`.
        #   REQUIRED
        # @param [String] target_web_site
        #   Web assets are identified by a URL that contains only the scheme, hostname
        #   and port parts.  The format is
        #   http[s]://<hostname>[:<port>]
        #   Hostnames must be fully qualified: they must end in a single period
        #   ("`.`").
        #   Only the schemes "http" and "https" are currently allowed.
        #   Port numbers are given as a decimal number, and they must be omitted if the
        #   standard port numbers are used: 80 for http and 443 for https.
        #   We call this limited URL the "site".  All URLs that share the same scheme,
        #   hostname and port are considered to be a part of the site and thus belong
        #   to the web asset.
        #   Example: the asset with the site `https://www.google.com` contains all
        #   these URLs:
        #   *   `https://www.google.com/`
        #   *   `https://www.google.com:443/`
        #   *   `https://www.google.com/foo`
        #   *   `https://www.google.com/foo?bar`
        #   *   `https://www.google.com/foo#bar`
        #   *   `https://user@password:www.google.com/`
        #   But it does not contain these URLs:
        #   *   `http://www.google.com/`       (wrong scheme)
        #   *   `https://google.com/`          (hostname does not match)
        #   *   `https://www.google.com:444/`  (port does not match)
        #   REQUIRED
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DigitalassetlinksV1::CheckResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DigitalassetlinksV1::CheckResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def check_assetlink(relation: nil, source_android_app_certificate_sha256_fingerprint: nil, source_android_app_package_name: nil, source_web_site: nil, target_android_app_certificate_sha256_fingerprint: nil, target_android_app_package_name: nil, target_web_site: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/assetlinks:check', options)
          command.response_representation = Google::Apis::DigitalassetlinksV1::CheckResponse::Representation
          command.response_class = Google::Apis::DigitalassetlinksV1::CheckResponse
          command.query['relation'] = relation unless relation.nil?
          command.query['source.androidApp.certificate.sha256Fingerprint'] = source_android_app_certificate_sha256_fingerprint unless source_android_app_certificate_sha256_fingerprint.nil?
          command.query['source.androidApp.packageName'] = source_android_app_package_name unless source_android_app_package_name.nil?
          command.query['source.web.site'] = source_web_site unless source_web_site.nil?
          command.query['target.androidApp.certificate.sha256Fingerprint'] = target_android_app_certificate_sha256_fingerprint unless target_android_app_certificate_sha256_fingerprint.nil?
          command.query['target.androidApp.packageName'] = target_android_app_package_name unless target_android_app_package_name.nil?
          command.query['target.web.site'] = target_web_site unless target_web_site.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of all statements from a given source that match the
        # specified target and statement string.
        # The API guarantees that all statements with secure source assets, such as
        # HTTPS websites or Android apps, have been made in a secure way by the owner
        # of those assets, as described in the [Digital Asset Links technical design
        # specification](https://github.com/google/digitalassetlinks/blob/master/well-
        # known/details.md).
        # Specifically, you should consider that for insecure websites (that is,
        # where the URL starts with `http://` instead of `https://`), this guarantee
        # cannot be made.
        # The `List` command is most useful in cases where the API client wants to
        # know all the ways in which two assets are related, or enumerate all the
        # relationships from a particular source asset.  Example: a feature that
        # helps users navigate to related items.  When a mobile app is running on a
        # device, the feature would make it easy to navigate to the corresponding web
        # site or Google+ profile.
        # @param [String] relation
        #   Use only associations that match the specified relation.
        #   See the [`Statement`](#Statement) message for a detailed definition of
        #   relation strings.
        #   For a query to match a statement, one of the following must be true:
        #   *    both the query's and the statement's relation strings match exactly,
        #   or
        #   *    the query's relation string is empty or missing.
        #   Example: A query with relation `delegate_permission/common.handle_all_urls`
        #   matches an asset link with relation
        #   `delegate_permission/common.handle_all_urls`.
        # @param [String] source_android_app_certificate_sha256_fingerprint
        #   The uppercase SHA-265 fingerprint of the certificate.  From the PEM
        #   certificate, it can be acquired like this:
        #   $ keytool -printcert -file $CERTFILE | grep SHA256:
        #   SHA256: 14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83: \
        #   42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   or like this:
        #   $ openssl x509 -in $CERTFILE -noout -fingerprint -sha256
        #   SHA256 Fingerprint=14:6D:E9:83:C5:73:06:50:D8:EE:B9:95:2F:34:FC:64: \
        #   16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:44:E5
        #   In this example, the contents of this field would be `14:6D:E9:83:C5:73:
        #   06:50:D8:EE:B9:95:2F:34:FC:64:16:A0:83:42:E6:1D:BE:A8:8A:04:96:B2:3F:CF:
        #   44:E5`.
        #   If these tools are not available to you, you can convert the PEM
        #   certificate into the DER format, compute the SHA-256 hash of that string
        #   and represent the result as a hexstring (that is, uppercase hexadecimal
        #   representations of each octet, separated by colons).
        # @param [String] source_android_app_package_name
        #   Android App assets are naturally identified by their Java package name.
        #   For example, the Google Maps app uses the package name
        #   `com.google.android.apps.maps`.
        #   REQUIRED
        # @param [String] source_web_site
        #   Web assets are identified by a URL that contains only the scheme, hostname
        #   and port parts.  The format is
        #   http[s]://<hostname>[:<port>]
        #   Hostnames must be fully qualified: they must end in a single period
        #   ("`.`").
        #   Only the schemes "http" and "https" are currently allowed.
        #   Port numbers are given as a decimal number, and they must be omitted if the
        #   standard port numbers are used: 80 for http and 443 for https.
        #   We call this limited URL the "site".  All URLs that share the same scheme,
        #   hostname and port are considered to be a part of the site and thus belong
        #   to the web asset.
        #   Example: the asset with the site `https://www.google.com` contains all
        #   these URLs:
        #   *   `https://www.google.com/`
        #   *   `https://www.google.com:443/`
        #   *   `https://www.google.com/foo`
        #   *   `https://www.google.com/foo?bar`
        #   *   `https://www.google.com/foo#bar`
        #   *   `https://user@password:www.google.com/`
        #   But it does not contain these URLs:
        #   *   `http://www.google.com/`       (wrong scheme)
        #   *   `https://google.com/`          (hostname does not match)
        #   *   `https://www.google.com:444/`  (port does not match)
        #   REQUIRED
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DigitalassetlinksV1::ListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DigitalassetlinksV1::ListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_statements(relation: nil, source_android_app_certificate_sha256_fingerprint: nil, source_android_app_package_name: nil, source_web_site: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/statements:list', options)
          command.response_representation = Google::Apis::DigitalassetlinksV1::ListResponse::Representation
          command.response_class = Google::Apis::DigitalassetlinksV1::ListResponse
          command.query['relation'] = relation unless relation.nil?
          command.query['source.androidApp.certificate.sha256Fingerprint'] = source_android_app_certificate_sha256_fingerprint unless source_android_app_certificate_sha256_fingerprint.nil?
          command.query['source.androidApp.packageName'] = source_android_app_package_name unless source_android_app_package_name.nil?
          command.query['source.web.site'] = source_web_site unless source_web_site.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
