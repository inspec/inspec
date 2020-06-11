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
    module IdentitytoolkitV3
      
      # Response of creating the IDP authentication URL.
      class CreateAuthUriResponse
        include Google::Apis::Core::Hashable
      
        # all providers the user has once used to do federated login
        # Corresponds to the JSON property `allProviders`
        # @return [Array<String>]
        attr_accessor :all_providers
      
        # The URI used by the IDP to authenticate the user.
        # Corresponds to the JSON property `authUri`
        # @return [String]
        attr_accessor :auth_uri
      
        # True if captcha is required.
        # Corresponds to the JSON property `captchaRequired`
        # @return [Boolean]
        attr_accessor :captcha_required
        alias_method :captcha_required?, :captcha_required
      
        # True if the authUri is for user's existing provider.
        # Corresponds to the JSON property `forExistingProvider`
        # @return [Boolean]
        attr_accessor :for_existing_provider
        alias_method :for_existing_provider?, :for_existing_provider
      
        # The fixed string identitytoolkit#CreateAuthUriResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The provider ID of the auth URI.
        # Corresponds to the JSON property `providerId`
        # @return [String]
        attr_accessor :provider_id
      
        # Whether the user is registered if the identifier is an email.
        # Corresponds to the JSON property `registered`
        # @return [Boolean]
        attr_accessor :registered
        alias_method :registered?, :registered
      
        # Session ID which should be passed in the following verifyAssertion request.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # All sign-in methods this user has used.
        # Corresponds to the JSON property `signinMethods`
        # @return [Array<String>]
        attr_accessor :signin_methods
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all_providers = args[:all_providers] if args.key?(:all_providers)
          @auth_uri = args[:auth_uri] if args.key?(:auth_uri)
          @captcha_required = args[:captcha_required] if args.key?(:captcha_required)
          @for_existing_provider = args[:for_existing_provider] if args.key?(:for_existing_provider)
          @kind = args[:kind] if args.key?(:kind)
          @provider_id = args[:provider_id] if args.key?(:provider_id)
          @registered = args[:registered] if args.key?(:registered)
          @session_id = args[:session_id] if args.key?(:session_id)
          @signin_methods = args[:signin_methods] if args.key?(:signin_methods)
        end
      end
      
      # Respone of deleting account.
      class DeleteAccountResponse
        include Google::Apis::Core::Hashable
      
        # The fixed string "identitytoolkit#DeleteAccountResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Response of downloading accounts in batch.
      class DownloadAccountResponse
        include Google::Apis::Core::Hashable
      
        # The fixed string "identitytoolkit#DownloadAccountResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The next page token. To be used in a subsequent request to return the next
        # page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The user accounts data.
        # Corresponds to the JSON property `users`
        # @return [Array<Google::Apis::IdentitytoolkitV3::UserInfo>]
        attr_accessor :users
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @users = args[:users] if args.key?(:users)
        end
      end
      
      # Response of email signIn.
      class EmailLinkSigninResponse
        include Google::Apis::Core::Hashable
      
        # The user's email.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Expiration time of STS id token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The STS id token to login the newly signed in user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # Whether the user is new.
        # Corresponds to the JSON property `isNewUser`
        # @return [Boolean]
        attr_accessor :is_new_user
        alias_method :is_new_user?, :is_new_user
      
        # The fixed string "identitytoolkit#EmailLinkSigninResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The RP local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The refresh token for the signed in user.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @is_new_user = args[:is_new_user] if args.key?(:is_new_user)
          @kind = args[:kind] if args.key?(:kind)
          @local_id = args[:local_id] if args.key?(:local_id)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
        end
      end
      
      # Template for an email template.
      class EmailTemplate
        include Google::Apis::Core::Hashable
      
        # Email body.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # Email body format.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # From address of the email.
        # Corresponds to the JSON property `from`
        # @return [String]
        attr_accessor :from
      
        # From display name.
        # Corresponds to the JSON property `fromDisplayName`
        # @return [String]
        attr_accessor :from_display_name
      
        # Reply-to address.
        # Corresponds to the JSON property `replyTo`
        # @return [String]
        attr_accessor :reply_to
      
        # Subject of the email.
        # Corresponds to the JSON property `subject`
        # @return [String]
        attr_accessor :subject
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @format = args[:format] if args.key?(:format)
          @from = args[:from] if args.key?(:from)
          @from_display_name = args[:from_display_name] if args.key?(:from_display_name)
          @reply_to = args[:reply_to] if args.key?(:reply_to)
          @subject = args[:subject] if args.key?(:subject)
        end
      end
      
      # Response of getting account information.
      class GetAccountInfoResponse
        include Google::Apis::Core::Hashable
      
        # The fixed string "identitytoolkit#GetAccountInfoResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The info of the users.
        # Corresponds to the JSON property `users`
        # @return [Array<Google::Apis::IdentitytoolkitV3::UserInfo>]
        attr_accessor :users
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @users = args[:users] if args.key?(:users)
        end
      end
      
      # Response of getting a code for user confirmation (reset password, change email
      # etc.).
      class GetOobConfirmationCodeResponse
        include Google::Apis::Core::Hashable
      
        # The email address that the email is sent to.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The fixed string "identitytoolkit#GetOobConfirmationCodeResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The code to be send to the user.
        # Corresponds to the JSON property `oobCode`
        # @return [String]
        attr_accessor :oob_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @kind = args[:kind] if args.key?(:kind)
          @oob_code = args[:oob_code] if args.key?(:oob_code)
        end
      end
      
      # Response of getting recaptcha param.
      class GetRecaptchaParamResponse
        include Google::Apis::Core::Hashable
      
        # The fixed string "identitytoolkit#GetRecaptchaParamResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Site key registered at recaptcha.
        # Corresponds to the JSON property `recaptchaSiteKey`
        # @return [String]
        attr_accessor :recaptcha_site_key
      
        # The stoken field for the recaptcha widget, used to request captcha challenge.
        # Corresponds to the JSON property `recaptchaStoken`
        # @return [String]
        attr_accessor :recaptcha_stoken
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @recaptcha_site_key = args[:recaptcha_site_key] if args.key?(:recaptcha_site_key)
          @recaptcha_stoken = args[:recaptcha_stoken] if args.key?(:recaptcha_stoken)
        end
      end
      
      # Request to get the IDP authentication URL.
      class CreateAuthUriRequest
        include Google::Apis::Core::Hashable
      
        # The app ID of the mobile app, base64(CERT_SHA1):PACKAGE_NAME for Android,
        # BUNDLE_ID for iOS.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # Explicitly specify the auth flow type. Currently only support "CODE_FLOW" type.
        # The field is only used for Google provider.
        # Corresponds to the JSON property `authFlowType`
        # @return [String]
        attr_accessor :auth_flow_type
      
        # The relying party OAuth client ID.
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # The opaque value used by the client to maintain context info between the
        # authentication request and the IDP callback.
        # Corresponds to the JSON property `context`
        # @return [String]
        attr_accessor :context
      
        # The URI to which the IDP redirects the user after the federated login flow.
        # Corresponds to the JSON property `continueUri`
        # @return [String]
        attr_accessor :continue_uri
      
        # The query parameter that client can customize by themselves in auth url. The
        # following parameters are reserved for server so that they cannot be customized
        # by clients: client_id, response_type, scope, redirect_uri, state, oauth_token.
        # Corresponds to the JSON property `customParameter`
        # @return [Hash<String,String>]
        attr_accessor :custom_parameter
      
        # The hosted domain to restrict sign-in to accounts at that domain for Google
        # Apps hosted accounts.
        # Corresponds to the JSON property `hostedDomain`
        # @return [String]
        attr_accessor :hosted_domain
      
        # The email or federated ID of the user.
        # Corresponds to the JSON property `identifier`
        # @return [String]
        attr_accessor :identifier
      
        # The developer's consumer key for OpenId OAuth Extension
        # Corresponds to the JSON property `oauthConsumerKey`
        # @return [String]
        attr_accessor :oauth_consumer_key
      
        # Additional oauth scopes, beyond the basid user profile, that the user would be
        # prompted to grant
        # Corresponds to the JSON property `oauthScope`
        # @return [String]
        attr_accessor :oauth_scope
      
        # Optional realm for OpenID protocol. The sub string "scheme://domain:port" of
        # the param "continueUri" is used if this is not set.
        # Corresponds to the JSON property `openidRealm`
        # @return [String]
        attr_accessor :openid_realm
      
        # The native app package for OTA installation.
        # Corresponds to the JSON property `otaApp`
        # @return [String]
        attr_accessor :ota_app
      
        # The IdP ID. For white listed IdPs it's a short domain name e.g. google.com,
        # aol.com, live.net and yahoo.com. For other OpenID IdPs it's the OP identifier.
        # Corresponds to the JSON property `providerId`
        # @return [String]
        attr_accessor :provider_id
      
        # The session_id passed by client.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # For multi-tenant use cases, in order to construct sign-in URL with the correct
        # IDP parameters, Firebear needs to know which Tenant to retrieve IDP configs
        # from.
        # Corresponds to the JSON property `tenantId`
        # @return [String]
        attr_accessor :tenant_id
      
        # Tenant project number to be used for idp discovery.
        # Corresponds to the JSON property `tenantProjectNumber`
        # @return [Fixnum]
        attr_accessor :tenant_project_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_id = args[:app_id] if args.key?(:app_id)
          @auth_flow_type = args[:auth_flow_type] if args.key?(:auth_flow_type)
          @client_id = args[:client_id] if args.key?(:client_id)
          @context = args[:context] if args.key?(:context)
          @continue_uri = args[:continue_uri] if args.key?(:continue_uri)
          @custom_parameter = args[:custom_parameter] if args.key?(:custom_parameter)
          @hosted_domain = args[:hosted_domain] if args.key?(:hosted_domain)
          @identifier = args[:identifier] if args.key?(:identifier)
          @oauth_consumer_key = args[:oauth_consumer_key] if args.key?(:oauth_consumer_key)
          @oauth_scope = args[:oauth_scope] if args.key?(:oauth_scope)
          @openid_realm = args[:openid_realm] if args.key?(:openid_realm)
          @ota_app = args[:ota_app] if args.key?(:ota_app)
          @provider_id = args[:provider_id] if args.key?(:provider_id)
          @session_id = args[:session_id] if args.key?(:session_id)
          @tenant_id = args[:tenant_id] if args.key?(:tenant_id)
          @tenant_project_number = args[:tenant_project_number] if args.key?(:tenant_project_number)
        end
      end
      
      # Request to delete account.
      class DeleteAccountRequest
        include Google::Apis::Core::Hashable
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The GITKit token or STS id token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @id_token = args[:id_token] if args.key?(:id_token)
          @local_id = args[:local_id] if args.key?(:local_id)
        end
      end
      
      # Request to download user account in batch.
      class DownloadAccountRequest
        include Google::Apis::Core::Hashable
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The max number of results to return in the response.
        # Corresponds to the JSON property `maxResults`
        # @return [Fixnum]
        attr_accessor :max_results
      
        # The token for the next page. This should be taken from the previous response.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Specify which project (field value is actually project id) to operate. Only
        # used when provided credential.
        # Corresponds to the JSON property `targetProjectId`
        # @return [String]
        attr_accessor :target_project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @max_results = args[:max_results] if args.key?(:max_results)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @target_project_id = args[:target_project_id] if args.key?(:target_project_id)
        end
      end
      
      # Request to sign in with email.
      class IdentitytoolkitRelyingpartyEmailLinkSigninRequest
        include Google::Apis::Core::Hashable
      
        # The email address of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Token for linking flow.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The confirmation code.
        # Corresponds to the JSON property `oobCode`
        # @return [String]
        attr_accessor :oob_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @id_token = args[:id_token] if args.key?(:id_token)
          @oob_code = args[:oob_code] if args.key?(:oob_code)
        end
      end
      
      # Request to get the account information.
      class GetAccountInfoRequest
        include Google::Apis::Core::Hashable
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The list of emails of the users to inquiry.
        # Corresponds to the JSON property `email`
        # @return [Array<String>]
        attr_accessor :email
      
        # The GITKit token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The list of local ID's of the users to inquiry.
        # Corresponds to the JSON property `localId`
        # @return [Array<String>]
        attr_accessor :local_id
      
        # Privileged caller can query users by specified phone number.
        # Corresponds to the JSON property `phoneNumber`
        # @return [Array<String>]
        attr_accessor :phone_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @email = args[:email] if args.key?(:email)
          @id_token = args[:id_token] if args.key?(:id_token)
          @local_id = args[:local_id] if args.key?(:local_id)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
        end
      end
      
      # Response of getting the project configuration.
      class GetProjectConfigResponse
        include Google::Apis::Core::Hashable
      
        # Whether to allow password user sign in or sign up.
        # Corresponds to the JSON property `allowPasswordUser`
        # @return [Boolean]
        attr_accessor :allow_password_user
        alias_method :allow_password_user?, :allow_password_user
      
        # Browser API key, needed when making http request to Apiary.
        # Corresponds to the JSON property `apiKey`
        # @return [String]
        attr_accessor :api_key
      
        # Authorized domains.
        # Corresponds to the JSON property `authorizedDomains`
        # @return [Array<String>]
        attr_accessor :authorized_domains
      
        # Template for an email template.
        # Corresponds to the JSON property `changeEmailTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :change_email_template
      
        # 
        # Corresponds to the JSON property `dynamicLinksDomain`
        # @return [String]
        attr_accessor :dynamic_links_domain
      
        # Whether anonymous user is enabled.
        # Corresponds to the JSON property `enableAnonymousUser`
        # @return [Boolean]
        attr_accessor :enable_anonymous_user
        alias_method :enable_anonymous_user?, :enable_anonymous_user
      
        # OAuth2 provider configuration.
        # Corresponds to the JSON property `idpConfig`
        # @return [Array<Google::Apis::IdentitytoolkitV3::IdpConfig>]
        attr_accessor :idp_config
      
        # Template for an email template.
        # Corresponds to the JSON property `legacyResetPasswordTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :legacy_reset_password_template
      
        # Project ID of the relying party.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Template for an email template.
        # Corresponds to the JSON property `resetPasswordTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :reset_password_template
      
        # Whether to use email sending provided by Firebear.
        # Corresponds to the JSON property `useEmailSending`
        # @return [Boolean]
        attr_accessor :use_email_sending
        alias_method :use_email_sending?, :use_email_sending
      
        # Template for an email template.
        # Corresponds to the JSON property `verifyEmailTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :verify_email_template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_password_user = args[:allow_password_user] if args.key?(:allow_password_user)
          @api_key = args[:api_key] if args.key?(:api_key)
          @authorized_domains = args[:authorized_domains] if args.key?(:authorized_domains)
          @change_email_template = args[:change_email_template] if args.key?(:change_email_template)
          @dynamic_links_domain = args[:dynamic_links_domain] if args.key?(:dynamic_links_domain)
          @enable_anonymous_user = args[:enable_anonymous_user] if args.key?(:enable_anonymous_user)
          @idp_config = args[:idp_config] if args.key?(:idp_config)
          @legacy_reset_password_template = args[:legacy_reset_password_template] if args.key?(:legacy_reset_password_template)
          @project_id = args[:project_id] if args.key?(:project_id)
          @reset_password_template = args[:reset_password_template] if args.key?(:reset_password_template)
          @use_email_sending = args[:use_email_sending] if args.key?(:use_email_sending)
          @verify_email_template = args[:verify_email_template] if args.key?(:verify_email_template)
        end
      end
      
      # Request to reset the password.
      class ResetPasswordRequest
        include Google::Apis::Core::Hashable
      
        # The email address of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The new password inputted by the user.
        # Corresponds to the JSON property `newPassword`
        # @return [String]
        attr_accessor :new_password
      
        # The old password inputted by the user.
        # Corresponds to the JSON property `oldPassword`
        # @return [String]
        attr_accessor :old_password
      
        # The confirmation code.
        # Corresponds to the JSON property `oobCode`
        # @return [String]
        attr_accessor :oob_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @new_password = args[:new_password] if args.key?(:new_password)
          @old_password = args[:old_password] if args.key?(:old_password)
          @oob_code = args[:oob_code] if args.key?(:oob_code)
        end
      end
      
      # Request for Identitytoolkit-SendVerificationCode
      class IdentitytoolkitRelyingpartySendVerificationCodeRequest
        include Google::Apis::Core::Hashable
      
        # Receipt of successful app token validation with APNS.
        # Corresponds to the JSON property `iosReceipt`
        # @return [String]
        attr_accessor :ios_receipt
      
        # Secret delivered to iOS app via APNS.
        # Corresponds to the JSON property `iosSecret`
        # @return [String]
        attr_accessor :ios_secret
      
        # The phone number to send the verification code to in E.164 format.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # Recaptcha solution.
        # Corresponds to the JSON property `recaptchaToken`
        # @return [String]
        attr_accessor :recaptcha_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ios_receipt = args[:ios_receipt] if args.key?(:ios_receipt)
          @ios_secret = args[:ios_secret] if args.key?(:ios_secret)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @recaptcha_token = args[:recaptcha_token] if args.key?(:recaptcha_token)
        end
      end
      
      # Response for Identitytoolkit-SendVerificationCode
      class IdentitytoolkitRelyingpartySendVerificationCodeResponse
        include Google::Apis::Core::Hashable
      
        # Encrypted session information
        # Corresponds to the JSON property `sessionInfo`
        # @return [String]
        attr_accessor :session_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @session_info = args[:session_info] if args.key?(:session_info)
        end
      end
      
      # Request to set the account information.
      class SetAccountInfoRequest
        include Google::Apis::Core::Hashable
      
        # The captcha challenge.
        # Corresponds to the JSON property `captchaChallenge`
        # @return [String]
        attr_accessor :captcha_challenge
      
        # Response to the captcha.
        # Corresponds to the JSON property `captchaResponse`
        # @return [String]
        attr_accessor :captcha_response
      
        # The timestamp when the account is created.
        # Corresponds to the JSON property `createdAt`
        # @return [Fixnum]
        attr_accessor :created_at
      
        # The custom attributes to be set in the user's id token.
        # Corresponds to the JSON property `customAttributes`
        # @return [String]
        attr_accessor :custom_attributes
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The attributes users request to delete.
        # Corresponds to the JSON property `deleteAttribute`
        # @return [Array<String>]
        attr_accessor :delete_attribute
      
        # The IDPs the user request to delete.
        # Corresponds to the JSON property `deleteProvider`
        # @return [Array<String>]
        attr_accessor :delete_provider
      
        # Whether to disable the user.
        # Corresponds to the JSON property `disableUser`
        # @return [Boolean]
        attr_accessor :disable_user
        alias_method :disable_user?, :disable_user
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Mark the email as verified or not.
        # Corresponds to the JSON property `emailVerified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # The GITKit token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Last login timestamp.
        # Corresponds to the JSON property `lastLoginAt`
        # @return [Fixnum]
        attr_accessor :last_login_at
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The out-of-band code of the change email request.
        # Corresponds to the JSON property `oobCode`
        # @return [String]
        attr_accessor :oob_code
      
        # The new password of the user.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # Privileged caller can update user with specified phone number.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # The photo url of the user.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # The associated IDPs of the user.
        # Corresponds to the JSON property `provider`
        # @return [Array<String>]
        attr_accessor :provider
      
        # Whether return sts id token and refresh token instead of gitkit token.
        # Corresponds to the JSON property `returnSecureToken`
        # @return [Boolean]
        attr_accessor :return_secure_token
        alias_method :return_secure_token?, :return_secure_token
      
        # Mark the user to upgrade to federated login.
        # Corresponds to the JSON property `upgradeToFederatedLogin`
        # @return [Boolean]
        attr_accessor :upgrade_to_federated_login
        alias_method :upgrade_to_federated_login?, :upgrade_to_federated_login
      
        # Timestamp in seconds for valid login token.
        # Corresponds to the JSON property `validSince`
        # @return [Fixnum]
        attr_accessor :valid_since
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @captcha_challenge = args[:captcha_challenge] if args.key?(:captcha_challenge)
          @captcha_response = args[:captcha_response] if args.key?(:captcha_response)
          @created_at = args[:created_at] if args.key?(:created_at)
          @custom_attributes = args[:custom_attributes] if args.key?(:custom_attributes)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @delete_attribute = args[:delete_attribute] if args.key?(:delete_attribute)
          @delete_provider = args[:delete_provider] if args.key?(:delete_provider)
          @disable_user = args[:disable_user] if args.key?(:disable_user)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @id_token = args[:id_token] if args.key?(:id_token)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @last_login_at = args[:last_login_at] if args.key?(:last_login_at)
          @local_id = args[:local_id] if args.key?(:local_id)
          @oob_code = args[:oob_code] if args.key?(:oob_code)
          @password = args[:password] if args.key?(:password)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @provider = args[:provider] if args.key?(:provider)
          @return_secure_token = args[:return_secure_token] if args.key?(:return_secure_token)
          @upgrade_to_federated_login = args[:upgrade_to_federated_login] if args.key?(:upgrade_to_federated_login)
          @valid_since = args[:valid_since] if args.key?(:valid_since)
        end
      end
      
      # Request to set the project configuration.
      class SetProjectConfigRequest
        include Google::Apis::Core::Hashable
      
        # Whether to allow password user sign in or sign up.
        # Corresponds to the JSON property `allowPasswordUser`
        # @return [Boolean]
        attr_accessor :allow_password_user
        alias_method :allow_password_user?, :allow_password_user
      
        # Browser API key, needed when making http request to Apiary.
        # Corresponds to the JSON property `apiKey`
        # @return [String]
        attr_accessor :api_key
      
        # Authorized domains for widget redirect.
        # Corresponds to the JSON property `authorizedDomains`
        # @return [Array<String>]
        attr_accessor :authorized_domains
      
        # Template for an email template.
        # Corresponds to the JSON property `changeEmailTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :change_email_template
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # Whether to enable anonymous user.
        # Corresponds to the JSON property `enableAnonymousUser`
        # @return [Boolean]
        attr_accessor :enable_anonymous_user
        alias_method :enable_anonymous_user?, :enable_anonymous_user
      
        # Oauth2 provider configuration.
        # Corresponds to the JSON property `idpConfig`
        # @return [Array<Google::Apis::IdentitytoolkitV3::IdpConfig>]
        attr_accessor :idp_config
      
        # Template for an email template.
        # Corresponds to the JSON property `legacyResetPasswordTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :legacy_reset_password_template
      
        # Template for an email template.
        # Corresponds to the JSON property `resetPasswordTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :reset_password_template
      
        # Whether to use email sending provided by Firebear.
        # Corresponds to the JSON property `useEmailSending`
        # @return [Boolean]
        attr_accessor :use_email_sending
        alias_method :use_email_sending?, :use_email_sending
      
        # Template for an email template.
        # Corresponds to the JSON property `verifyEmailTemplate`
        # @return [Google::Apis::IdentitytoolkitV3::EmailTemplate]
        attr_accessor :verify_email_template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_password_user = args[:allow_password_user] if args.key?(:allow_password_user)
          @api_key = args[:api_key] if args.key?(:api_key)
          @authorized_domains = args[:authorized_domains] if args.key?(:authorized_domains)
          @change_email_template = args[:change_email_template] if args.key?(:change_email_template)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @enable_anonymous_user = args[:enable_anonymous_user] if args.key?(:enable_anonymous_user)
          @idp_config = args[:idp_config] if args.key?(:idp_config)
          @legacy_reset_password_template = args[:legacy_reset_password_template] if args.key?(:legacy_reset_password_template)
          @reset_password_template = args[:reset_password_template] if args.key?(:reset_password_template)
          @use_email_sending = args[:use_email_sending] if args.key?(:use_email_sending)
          @verify_email_template = args[:verify_email_template] if args.key?(:verify_email_template)
        end
      end
      
      # Response of setting the project configuration.
      class IdentitytoolkitRelyingpartySetProjectConfigResponse
        include Google::Apis::Core::Hashable
      
        # Project ID of the relying party.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Request to sign out user.
      class SignOutUserRequest
        include Google::Apis::Core::Hashable
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @local_id = args[:local_id] if args.key?(:local_id)
        end
      end
      
      # Response of signing out user.
      class SignOutUserResponse
        include Google::Apis::Core::Hashable
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @local_id = args[:local_id] if args.key?(:local_id)
        end
      end
      
      # Request to signup new user, create anonymous user or anonymous user reauth.
      class SignupNewUserRequest
        include Google::Apis::Core::Hashable
      
        # The captcha challenge.
        # Corresponds to the JSON property `captchaChallenge`
        # @return [String]
        attr_accessor :captcha_challenge
      
        # Response to the captcha.
        # Corresponds to the JSON property `captchaResponse`
        # @return [String]
        attr_accessor :captcha_response
      
        # Whether to disable the user. Only can be used by service account.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Mark the email as verified or not. Only can be used by service account.
        # Corresponds to the JSON property `emailVerified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # The GITKit token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Privileged caller can create user with specified user id.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The new password of the user.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # Privileged caller can create user with specified phone number.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # The photo url of the user.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # For multi-tenant use cases, in order to construct sign-in URL with the correct
        # IDP parameters, Firebear needs to know which Tenant to retrieve IDP configs
        # from.
        # Corresponds to the JSON property `tenantId`
        # @return [String]
        attr_accessor :tenant_id
      
        # Tenant project number to be used for idp discovery.
        # Corresponds to the JSON property `tenantProjectNumber`
        # @return [Fixnum]
        attr_accessor :tenant_project_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @captcha_challenge = args[:captcha_challenge] if args.key?(:captcha_challenge)
          @captcha_response = args[:captcha_response] if args.key?(:captcha_response)
          @disabled = args[:disabled] if args.key?(:disabled)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @id_token = args[:id_token] if args.key?(:id_token)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @local_id = args[:local_id] if args.key?(:local_id)
          @password = args[:password] if args.key?(:password)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @tenant_id = args[:tenant_id] if args.key?(:tenant_id)
          @tenant_project_number = args[:tenant_project_number] if args.key?(:tenant_project_number)
        end
      end
      
      # Request to upload user account in batch.
      class UploadAccountRequest
        include Google::Apis::Core::Hashable
      
        # Whether allow overwrite existing account when user local_id exists.
        # Corresponds to the JSON property `allowOverwrite`
        # @return [Boolean]
        attr_accessor :allow_overwrite
        alias_method :allow_overwrite?, :allow_overwrite
      
        # 
        # Corresponds to the JSON property `blockSize`
        # @return [Fixnum]
        attr_accessor :block_size
      
        # The following 4 fields are for standard scrypt algorithm.
        # Corresponds to the JSON property `cpuMemCost`
        # @return [Fixnum]
        attr_accessor :cpu_mem_cost
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # 
        # Corresponds to the JSON property `dkLen`
        # @return [Fixnum]
        attr_accessor :dk_len
      
        # The password hash algorithm.
        # Corresponds to the JSON property `hashAlgorithm`
        # @return [String]
        attr_accessor :hash_algorithm
      
        # Memory cost for hash calculation. Used by scrypt similar algorithms.
        # Corresponds to the JSON property `memoryCost`
        # @return [Fixnum]
        attr_accessor :memory_cost
      
        # 
        # Corresponds to the JSON property `parallelization`
        # @return [Fixnum]
        attr_accessor :parallelization
      
        # Rounds for hash calculation. Used by scrypt and similar algorithms.
        # Corresponds to the JSON property `rounds`
        # @return [Fixnum]
        attr_accessor :rounds
      
        # The salt separator.
        # Corresponds to the JSON property `saltSeparator`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :salt_separator
      
        # If true, backend will do sanity check(including duplicate email and federated
        # id) when uploading account.
        # Corresponds to the JSON property `sanityCheck`
        # @return [Boolean]
        attr_accessor :sanity_check
        alias_method :sanity_check?, :sanity_check
      
        # The key for to hash the password.
        # Corresponds to the JSON property `signerKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :signer_key
      
        # Specify which project (field value is actually project id) to operate. Only
        # used when provided credential.
        # Corresponds to the JSON property `targetProjectId`
        # @return [String]
        attr_accessor :target_project_id
      
        # The account info to be stored.
        # Corresponds to the JSON property `users`
        # @return [Array<Google::Apis::IdentitytoolkitV3::UserInfo>]
        attr_accessor :users
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_overwrite = args[:allow_overwrite] if args.key?(:allow_overwrite)
          @block_size = args[:block_size] if args.key?(:block_size)
          @cpu_mem_cost = args[:cpu_mem_cost] if args.key?(:cpu_mem_cost)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @dk_len = args[:dk_len] if args.key?(:dk_len)
          @hash_algorithm = args[:hash_algorithm] if args.key?(:hash_algorithm)
          @memory_cost = args[:memory_cost] if args.key?(:memory_cost)
          @parallelization = args[:parallelization] if args.key?(:parallelization)
          @rounds = args[:rounds] if args.key?(:rounds)
          @salt_separator = args[:salt_separator] if args.key?(:salt_separator)
          @sanity_check = args[:sanity_check] if args.key?(:sanity_check)
          @signer_key = args[:signer_key] if args.key?(:signer_key)
          @target_project_id = args[:target_project_id] if args.key?(:target_project_id)
          @users = args[:users] if args.key?(:users)
        end
      end
      
      # Request to verify the IDP assertion.
      class VerifyAssertionRequest
        include Google::Apis::Core::Hashable
      
        # When it's true, automatically creates a new account if the user doesn't exist.
        # When it's false, allows existing user to sign in normally and throws exception
        # if the user doesn't exist.
        # Corresponds to the JSON property `autoCreate`
        # @return [Boolean]
        attr_accessor :auto_create
        alias_method :auto_create?, :auto_create
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The GITKit token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The GITKit token for the non-trusted IDP pending to be confirmed by the user.
        # Corresponds to the JSON property `pendingIdToken`
        # @return [String]
        attr_accessor :pending_id_token
      
        # The post body if the request is a HTTP POST.
        # Corresponds to the JSON property `postBody`
        # @return [String]
        attr_accessor :post_body
      
        # The URI to which the IDP redirects the user back. It may contain federated
        # login result params added by the IDP.
        # Corresponds to the JSON property `requestUri`
        # @return [String]
        attr_accessor :request_uri
      
        # Whether return 200 and IDP credential rather than throw exception when
        # federated id is already linked.
        # Corresponds to the JSON property `returnIdpCredential`
        # @return [Boolean]
        attr_accessor :return_idp_credential
        alias_method :return_idp_credential?, :return_idp_credential
      
        # Whether to return refresh tokens.
        # Corresponds to the JSON property `returnRefreshToken`
        # @return [Boolean]
        attr_accessor :return_refresh_token
        alias_method :return_refresh_token?, :return_refresh_token
      
        # Whether return sts id token and refresh token instead of gitkit token.
        # Corresponds to the JSON property `returnSecureToken`
        # @return [Boolean]
        attr_accessor :return_secure_token
        alias_method :return_secure_token?, :return_secure_token
      
        # Session ID, which should match the one in previous createAuthUri request.
        # Corresponds to the JSON property `sessionId`
        # @return [String]
        attr_accessor :session_id
      
        # For multi-tenant use cases, in order to construct sign-in URL with the correct
        # IDP parameters, Firebear needs to know which Tenant to retrieve IDP configs
        # from.
        # Corresponds to the JSON property `tenantId`
        # @return [String]
        attr_accessor :tenant_id
      
        # Tenant project number to be used for idp discovery.
        # Corresponds to the JSON property `tenantProjectNumber`
        # @return [Fixnum]
        attr_accessor :tenant_project_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_create = args[:auto_create] if args.key?(:auto_create)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @id_token = args[:id_token] if args.key?(:id_token)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @pending_id_token = args[:pending_id_token] if args.key?(:pending_id_token)
          @post_body = args[:post_body] if args.key?(:post_body)
          @request_uri = args[:request_uri] if args.key?(:request_uri)
          @return_idp_credential = args[:return_idp_credential] if args.key?(:return_idp_credential)
          @return_refresh_token = args[:return_refresh_token] if args.key?(:return_refresh_token)
          @return_secure_token = args[:return_secure_token] if args.key?(:return_secure_token)
          @session_id = args[:session_id] if args.key?(:session_id)
          @tenant_id = args[:tenant_id] if args.key?(:tenant_id)
          @tenant_project_number = args[:tenant_project_number] if args.key?(:tenant_project_number)
        end
      end
      
      # Request to verify a custom token
      class VerifyCustomTokenRequest
        include Google::Apis::Core::Hashable
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Whether return sts id token and refresh token instead of gitkit token.
        # Corresponds to the JSON property `returnSecureToken`
        # @return [Boolean]
        attr_accessor :return_secure_token
        alias_method :return_secure_token?, :return_secure_token
      
        # The custom token to verify
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @return_secure_token = args[:return_secure_token] if args.key?(:return_secure_token)
          @token = args[:token] if args.key?(:token)
        end
      end
      
      # Request to verify the password.
      class VerifyPasswordRequest
        include Google::Apis::Core::Hashable
      
        # The captcha challenge.
        # Corresponds to the JSON property `captchaChallenge`
        # @return [String]
        attr_accessor :captcha_challenge
      
        # Response to the captcha.
        # Corresponds to the JSON property `captchaResponse`
        # @return [String]
        attr_accessor :captcha_response
      
        # GCP project number of the requesting delegated app. Currently only intended
        # for Firebase V1 migration.
        # Corresponds to the JSON property `delegatedProjectNumber`
        # @return [Fixnum]
        attr_accessor :delegated_project_number
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The GITKit token of the authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # Instance id token of the app.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # The password inputed by the user.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The GITKit token for the non-trusted IDP, which is to be confirmed by the user.
        # Corresponds to the JSON property `pendingIdToken`
        # @return [String]
        attr_accessor :pending_id_token
      
        # Whether return sts id token and refresh token instead of gitkit token.
        # Corresponds to the JSON property `returnSecureToken`
        # @return [Boolean]
        attr_accessor :return_secure_token
        alias_method :return_secure_token?, :return_secure_token
      
        # For multi-tenant use cases, in order to construct sign-in URL with the correct
        # IDP parameters, Firebear needs to know which Tenant to retrieve IDP configs
        # from.
        # Corresponds to the JSON property `tenantId`
        # @return [String]
        attr_accessor :tenant_id
      
        # Tenant project number to be used for idp discovery.
        # Corresponds to the JSON property `tenantProjectNumber`
        # @return [Fixnum]
        attr_accessor :tenant_project_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @captcha_challenge = args[:captcha_challenge] if args.key?(:captcha_challenge)
          @captcha_response = args[:captcha_response] if args.key?(:captcha_response)
          @delegated_project_number = args[:delegated_project_number] if args.key?(:delegated_project_number)
          @email = args[:email] if args.key?(:email)
          @id_token = args[:id_token] if args.key?(:id_token)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @password = args[:password] if args.key?(:password)
          @pending_id_token = args[:pending_id_token] if args.key?(:pending_id_token)
          @return_secure_token = args[:return_secure_token] if args.key?(:return_secure_token)
          @tenant_id = args[:tenant_id] if args.key?(:tenant_id)
          @tenant_project_number = args[:tenant_project_number] if args.key?(:tenant_project_number)
        end
      end
      
      # Request for Identitytoolkit-VerifyPhoneNumber
      class IdentitytoolkitRelyingpartyVerifyPhoneNumberRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # 
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # 
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        # 
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # The session info previously returned by IdentityToolkit-SendVerificationCode.
        # Corresponds to the JSON property `sessionInfo`
        # @return [String]
        attr_accessor :session_info
      
        # 
        # Corresponds to the JSON property `temporaryProof`
        # @return [String]
        attr_accessor :temporary_proof
      
        # 
        # Corresponds to the JSON property `verificationProof`
        # @return [String]
        attr_accessor :verification_proof
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @id_token = args[:id_token] if args.key?(:id_token)
          @operation = args[:operation] if args.key?(:operation)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @session_info = args[:session_info] if args.key?(:session_info)
          @temporary_proof = args[:temporary_proof] if args.key?(:temporary_proof)
          @verification_proof = args[:verification_proof] if args.key?(:verification_proof)
        end
      end
      
      # Response for Identitytoolkit-VerifyPhoneNumber
      class IdentitytoolkitRelyingpartyVerifyPhoneNumberResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # 
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # 
        # Corresponds to the JSON property `isNewUser`
        # @return [Boolean]
        attr_accessor :is_new_user
        alias_method :is_new_user?, :is_new_user
      
        # 
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # 
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # 
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        # 
        # Corresponds to the JSON property `temporaryProof`
        # @return [String]
        attr_accessor :temporary_proof
      
        # 
        # Corresponds to the JSON property `temporaryProofExpiresIn`
        # @return [Fixnum]
        attr_accessor :temporary_proof_expires_in
      
        # 
        # Corresponds to the JSON property `verificationProof`
        # @return [String]
        attr_accessor :verification_proof
      
        # 
        # Corresponds to the JSON property `verificationProofExpiresIn`
        # @return [Fixnum]
        attr_accessor :verification_proof_expires_in
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @is_new_user = args[:is_new_user] if args.key?(:is_new_user)
          @local_id = args[:local_id] if args.key?(:local_id)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
          @temporary_proof = args[:temporary_proof] if args.key?(:temporary_proof)
          @temporary_proof_expires_in = args[:temporary_proof_expires_in] if args.key?(:temporary_proof_expires_in)
          @verification_proof = args[:verification_proof] if args.key?(:verification_proof)
          @verification_proof_expires_in = args[:verification_proof_expires_in] if args.key?(:verification_proof_expires_in)
        end
      end
      
      # Template for a single idp configuration.
      class IdpConfig
        include Google::Apis::Core::Hashable
      
        # OAuth2 client ID.
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # Whether this IDP is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Percent of users who will be prompted/redirected federated login for this IDP.
        # Corresponds to the JSON property `experimentPercent`
        # @return [Fixnum]
        attr_accessor :experiment_percent
      
        # OAuth2 provider.
        # Corresponds to the JSON property `provider`
        # @return [String]
        attr_accessor :provider
      
        # OAuth2 client secret.
        # Corresponds to the JSON property `secret`
        # @return [String]
        attr_accessor :secret
      
        # Whitelisted client IDs for audience check.
        # Corresponds to the JSON property `whitelistedAudiences`
        # @return [Array<String>]
        attr_accessor :whitelisted_audiences
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @enabled = args[:enabled] if args.key?(:enabled)
          @experiment_percent = args[:experiment_percent] if args.key?(:experiment_percent)
          @provider = args[:provider] if args.key?(:provider)
          @secret = args[:secret] if args.key?(:secret)
          @whitelisted_audiences = args[:whitelisted_audiences] if args.key?(:whitelisted_audiences)
        end
      end
      
      # Request of getting a code for user confirmation (reset password, change email
      # etc.)
      class Relyingparty
        include Google::Apis::Core::Hashable
      
        # whether or not to install the android app on the device where the link is
        # opened
        # Corresponds to the JSON property `androidInstallApp`
        # @return [Boolean]
        attr_accessor :android_install_app
        alias_method :android_install_app?, :android_install_app
      
        # minimum version of the app. if the version on the device is lower than this
        # version then the user is taken to the play store to upgrade the app
        # Corresponds to the JSON property `androidMinimumVersion`
        # @return [String]
        attr_accessor :android_minimum_version
      
        # android package name of the android app to handle the action code
        # Corresponds to the JSON property `androidPackageName`
        # @return [String]
        attr_accessor :android_package_name
      
        # whether or not the app can handle the oob code without first going to web
        # Corresponds to the JSON property `canHandleCodeInApp`
        # @return [Boolean]
        attr_accessor :can_handle_code_in_app
        alias_method :can_handle_code_in_app?, :can_handle_code_in_app
      
        # The recaptcha response from the user.
        # Corresponds to the JSON property `captchaResp`
        # @return [String]
        attr_accessor :captcha_resp
      
        # The recaptcha challenge presented to the user.
        # Corresponds to the JSON property `challenge`
        # @return [String]
        attr_accessor :challenge
      
        # The url to continue to the Gitkit app
        # Corresponds to the JSON property `continueUrl`
        # @return [String]
        attr_accessor :continue_url
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # iOS app store id to download the app if it's not already installed
        # Corresponds to the JSON property `iOSAppStoreId`
        # @return [String]
        attr_accessor :i_os_app_store_id
      
        # the iOS bundle id of iOS app to handle the action code
        # Corresponds to the JSON property `iOSBundleId`
        # @return [String]
        attr_accessor :i_os_bundle_id
      
        # The user's Gitkit login token for email change.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The fixed string "identitytoolkit#relyingparty".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The new email if the code is for email change.
        # Corresponds to the JSON property `newEmail`
        # @return [String]
        attr_accessor :new_email
      
        # The request type.
        # Corresponds to the JSON property `requestType`
        # @return [String]
        attr_accessor :request_type
      
        # The IP address of the user.
        # Corresponds to the JSON property `userIp`
        # @return [String]
        attr_accessor :user_ip
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_install_app = args[:android_install_app] if args.key?(:android_install_app)
          @android_minimum_version = args[:android_minimum_version] if args.key?(:android_minimum_version)
          @android_package_name = args[:android_package_name] if args.key?(:android_package_name)
          @can_handle_code_in_app = args[:can_handle_code_in_app] if args.key?(:can_handle_code_in_app)
          @captcha_resp = args[:captcha_resp] if args.key?(:captcha_resp)
          @challenge = args[:challenge] if args.key?(:challenge)
          @continue_url = args[:continue_url] if args.key?(:continue_url)
          @email = args[:email] if args.key?(:email)
          @i_os_app_store_id = args[:i_os_app_store_id] if args.key?(:i_os_app_store_id)
          @i_os_bundle_id = args[:i_os_bundle_id] if args.key?(:i_os_bundle_id)
          @id_token = args[:id_token] if args.key?(:id_token)
          @kind = args[:kind] if args.key?(:kind)
          @new_email = args[:new_email] if args.key?(:new_email)
          @request_type = args[:request_type] if args.key?(:request_type)
          @user_ip = args[:user_ip] if args.key?(:user_ip)
        end
      end
      
      # Response of resetting the password.
      class ResetPasswordResponse
        include Google::Apis::Core::Hashable
      
        # The user's email. If the out-of-band code is for email recovery, the user's
        # original email.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The fixed string "identitytoolkit#ResetPasswordResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # If the out-of-band code is for email recovery, the user's new email.
        # Corresponds to the JSON property `newEmail`
        # @return [String]
        attr_accessor :new_email
      
        # The request type.
        # Corresponds to the JSON property `requestType`
        # @return [String]
        attr_accessor :request_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @kind = args[:kind] if args.key?(:kind)
          @new_email = args[:new_email] if args.key?(:new_email)
          @request_type = args[:request_type] if args.key?(:request_type)
        end
      end
      
      # Respone of setting the account information.
      class SetAccountInfoResponse
        include Google::Apis::Core::Hashable
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # If email has been verified.
        # Corresponds to the JSON property `emailVerified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # If idToken is STS id token, then this field will be expiration time of STS id
        # token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The Gitkit id token to login the newly sign up user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The fixed string "identitytoolkit#SetAccountInfoResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The new email the user attempts to change to.
        # Corresponds to the JSON property `newEmail`
        # @return [String]
        attr_accessor :new_email
      
        # The user's hashed password.
        # Corresponds to the JSON property `passwordHash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :password_hash
      
        # The photo url of the user.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # The user's profiles at the associated IdPs.
        # Corresponds to the JSON property `providerUserInfo`
        # @return [Array<Google::Apis::IdentitytoolkitV3::SetAccountInfoResponse::ProviderUserInfo>]
        attr_accessor :provider_user_info
      
        # If idToken is STS id token, then this field will be refresh token.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @kind = args[:kind] if args.key?(:kind)
          @local_id = args[:local_id] if args.key?(:local_id)
          @new_email = args[:new_email] if args.key?(:new_email)
          @password_hash = args[:password_hash] if args.key?(:password_hash)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @provider_user_info = args[:provider_user_info] if args.key?(:provider_user_info)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
        end
        
        # 
        class ProviderUserInfo
          include Google::Apis::Core::Hashable
        
          # The user's display name at the IDP.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # User's identifier at IDP.
          # Corresponds to the JSON property `federatedId`
          # @return [String]
          attr_accessor :federated_id
        
          # The user's photo url at the IDP.
          # Corresponds to the JSON property `photoUrl`
          # @return [String]
          attr_accessor :photo_url
        
          # The IdP ID. For whitelisted IdPs it's a short domain name, e.g., google.com,
          # aol.com, live.net and yahoo.com. For other OpenID IdPs it's the OP identifier.
          # Corresponds to the JSON property `providerId`
          # @return [String]
          attr_accessor :provider_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @federated_id = args[:federated_id] if args.key?(:federated_id)
            @photo_url = args[:photo_url] if args.key?(:photo_url)
            @provider_id = args[:provider_id] if args.key?(:provider_id)
          end
        end
      end
      
      # Response of signing up new user, creating anonymous user or anonymous user
      # reauth.
      class SignupNewUserResponse
        include Google::Apis::Core::Hashable
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # If idToken is STS id token, then this field will be expiration time of STS id
        # token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The Gitkit id token to login the newly sign up user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The fixed string "identitytoolkit#SignupNewUserResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The RP local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # If idToken is STS id token, then this field will be refresh token.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @kind = args[:kind] if args.key?(:kind)
          @local_id = args[:local_id] if args.key?(:local_id)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
        end
      end
      
      # Respone of uploading accounts in batch.
      class UploadAccountResponse
        include Google::Apis::Core::Hashable
      
        # The error encountered while processing the account info.
        # Corresponds to the JSON property `error`
        # @return [Array<Google::Apis::IdentitytoolkitV3::UploadAccountResponse::Error>]
        attr_accessor :error
      
        # The fixed string "identitytoolkit#UploadAccountResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error = args[:error] if args.key?(:error)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Error
          include Google::Apis::Core::Hashable
        
          # The index of the malformed account, starting from 0.
          # Corresponds to the JSON property `index`
          # @return [Fixnum]
          attr_accessor :index
        
          # Detailed error message for the account info.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @index = args[:index] if args.key?(:index)
            @message = args[:message] if args.key?(:message)
          end
        end
      end
      
      # Template for an individual account info.
      class UserInfo
        include Google::Apis::Core::Hashable
      
        # User creation timestamp.
        # Corresponds to the JSON property `createdAt`
        # @return [Fixnum]
        attr_accessor :created_at
      
        # The custom attributes to be set in the user's id token.
        # Corresponds to the JSON property `customAttributes`
        # @return [String]
        attr_accessor :custom_attributes
      
        # Whether the user is authenticated by the developer.
        # Corresponds to the JSON property `customAuth`
        # @return [Boolean]
        attr_accessor :custom_auth
        alias_method :custom_auth?, :custom_auth
      
        # Whether the user is disabled.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email of the user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # Whether the email has been verified.
        # Corresponds to the JSON property `emailVerified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # last login timestamp.
        # Corresponds to the JSON property `lastLoginAt`
        # @return [Fixnum]
        attr_accessor :last_login_at
      
        # The local ID of the user.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The user's hashed password.
        # Corresponds to the JSON property `passwordHash`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :password_hash
      
        # The timestamp when the password was last updated.
        # Corresponds to the JSON property `passwordUpdatedAt`
        # @return [Float]
        attr_accessor :password_updated_at
      
        # User's phone number.
        # Corresponds to the JSON property `phoneNumber`
        # @return [String]
        attr_accessor :phone_number
      
        # The URL of the user profile photo.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # The IDP of the user.
        # Corresponds to the JSON property `providerUserInfo`
        # @return [Array<Google::Apis::IdentitytoolkitV3::UserInfo::ProviderUserInfo>]
        attr_accessor :provider_user_info
      
        # The user's plain text password.
        # Corresponds to the JSON property `rawPassword`
        # @return [String]
        attr_accessor :raw_password
      
        # The user's password salt.
        # Corresponds to the JSON property `salt`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :salt
      
        # User's screen name at Twitter or login name at Github.
        # Corresponds to the JSON property `screenName`
        # @return [String]
        attr_accessor :screen_name
      
        # Timestamp in seconds for valid login token.
        # Corresponds to the JSON property `validSince`
        # @return [Fixnum]
        attr_accessor :valid_since
      
        # Version of the user's password.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @created_at = args[:created_at] if args.key?(:created_at)
          @custom_attributes = args[:custom_attributes] if args.key?(:custom_attributes)
          @custom_auth = args[:custom_auth] if args.key?(:custom_auth)
          @disabled = args[:disabled] if args.key?(:disabled)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @last_login_at = args[:last_login_at] if args.key?(:last_login_at)
          @local_id = args[:local_id] if args.key?(:local_id)
          @password_hash = args[:password_hash] if args.key?(:password_hash)
          @password_updated_at = args[:password_updated_at] if args.key?(:password_updated_at)
          @phone_number = args[:phone_number] if args.key?(:phone_number)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @provider_user_info = args[:provider_user_info] if args.key?(:provider_user_info)
          @raw_password = args[:raw_password] if args.key?(:raw_password)
          @salt = args[:salt] if args.key?(:salt)
          @screen_name = args[:screen_name] if args.key?(:screen_name)
          @valid_since = args[:valid_since] if args.key?(:valid_since)
          @version = args[:version] if args.key?(:version)
        end
        
        # 
        class ProviderUserInfo
          include Google::Apis::Core::Hashable
        
          # The user's display name at the IDP.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # User's email at IDP.
          # Corresponds to the JSON property `email`
          # @return [String]
          attr_accessor :email
        
          # User's identifier at IDP.
          # Corresponds to the JSON property `federatedId`
          # @return [String]
          attr_accessor :federated_id
        
          # User's phone number.
          # Corresponds to the JSON property `phoneNumber`
          # @return [String]
          attr_accessor :phone_number
        
          # The user's photo url at the IDP.
          # Corresponds to the JSON property `photoUrl`
          # @return [String]
          attr_accessor :photo_url
        
          # The IdP ID. For white listed IdPs it's a short domain name, e.g., google.com,
          # aol.com, live.net and yahoo.com. For other OpenID IdPs it's the OP identifier.
          # Corresponds to the JSON property `providerId`
          # @return [String]
          attr_accessor :provider_id
        
          # User's raw identifier directly returned from IDP.
          # Corresponds to the JSON property `rawId`
          # @return [String]
          attr_accessor :raw_id
        
          # User's screen name at Twitter or login name at Github.
          # Corresponds to the JSON property `screenName`
          # @return [String]
          attr_accessor :screen_name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @email = args[:email] if args.key?(:email)
            @federated_id = args[:federated_id] if args.key?(:federated_id)
            @phone_number = args[:phone_number] if args.key?(:phone_number)
            @photo_url = args[:photo_url] if args.key?(:photo_url)
            @provider_id = args[:provider_id] if args.key?(:provider_id)
            @raw_id = args[:raw_id] if args.key?(:raw_id)
            @screen_name = args[:screen_name] if args.key?(:screen_name)
          end
        end
      end
      
      # Response of verifying the IDP assertion.
      class VerifyAssertionResponse
        include Google::Apis::Core::Hashable
      
        # The action code.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # URL for OTA app installation.
        # Corresponds to the JSON property `appInstallationUrl`
        # @return [String]
        attr_accessor :app_installation_url
      
        # The custom scheme used by mobile app.
        # Corresponds to the JSON property `appScheme`
        # @return [String]
        attr_accessor :app_scheme
      
        # The opaque value used by the client to maintain context info between the
        # authentication request and the IDP callback.
        # Corresponds to the JSON property `context`
        # @return [String]
        attr_accessor :context
      
        # The birth date of the IdP account.
        # Corresponds to the JSON property `dateOfBirth`
        # @return [String]
        attr_accessor :date_of_birth
      
        # The display name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email returned by the IdP. NOTE: The federated login user may not own the
        # email.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # It's true if the email is recycled.
        # Corresponds to the JSON property `emailRecycled`
        # @return [Boolean]
        attr_accessor :email_recycled
        alias_method :email_recycled?, :email_recycled
      
        # The value is true if the IDP is also the email provider. It means the user
        # owns the email.
        # Corresponds to the JSON property `emailVerified`
        # @return [Boolean]
        attr_accessor :email_verified
        alias_method :email_verified?, :email_verified
      
        # Client error code.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # If idToken is STS id token, then this field will be expiration time of STS id
        # token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The unique ID identifies the IdP account.
        # Corresponds to the JSON property `federatedId`
        # @return [String]
        attr_accessor :federated_id
      
        # The first name of the user.
        # Corresponds to the JSON property `firstName`
        # @return [String]
        attr_accessor :first_name
      
        # The full name of the user.
        # Corresponds to the JSON property `fullName`
        # @return [String]
        attr_accessor :full_name
      
        # The ID token.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # It's the identifier param in the createAuthUri request if the identifier is an
        # email. It can be used to check whether the user input email is different from
        # the asserted email.
        # Corresponds to the JSON property `inputEmail`
        # @return [String]
        attr_accessor :input_email
      
        # True if it's a new user sign-in, false if it's a returning user.
        # Corresponds to the JSON property `isNewUser`
        # @return [Boolean]
        attr_accessor :is_new_user
        alias_method :is_new_user?, :is_new_user
      
        # The fixed string "identitytoolkit#VerifyAssertionResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The language preference of the user.
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # The last name of the user.
        # Corresponds to the JSON property `lastName`
        # @return [String]
        attr_accessor :last_name
      
        # The RP local ID if it's already been mapped to the IdP account identified by
        # the federated ID.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # Whether the assertion is from a non-trusted IDP and need account linking
        # confirmation.
        # Corresponds to the JSON property `needConfirmation`
        # @return [Boolean]
        attr_accessor :need_confirmation
        alias_method :need_confirmation?, :need_confirmation
      
        # Whether need client to supply email to complete the federated login flow.
        # Corresponds to the JSON property `needEmail`
        # @return [Boolean]
        attr_accessor :need_email
        alias_method :need_email?, :need_email
      
        # The nick name of the user.
        # Corresponds to the JSON property `nickName`
        # @return [String]
        attr_accessor :nick_name
      
        # The OAuth2 access token.
        # Corresponds to the JSON property `oauthAccessToken`
        # @return [String]
        attr_accessor :oauth_access_token
      
        # The OAuth2 authorization code.
        # Corresponds to the JSON property `oauthAuthorizationCode`
        # @return [String]
        attr_accessor :oauth_authorization_code
      
        # The lifetime in seconds of the OAuth2 access token.
        # Corresponds to the JSON property `oauthExpireIn`
        # @return [Fixnum]
        attr_accessor :oauth_expire_in
      
        # The OIDC id token.
        # Corresponds to the JSON property `oauthIdToken`
        # @return [String]
        attr_accessor :oauth_id_token
      
        # The user approved request token for the OpenID OAuth extension.
        # Corresponds to the JSON property `oauthRequestToken`
        # @return [String]
        attr_accessor :oauth_request_token
      
        # The scope for the OpenID OAuth extension.
        # Corresponds to the JSON property `oauthScope`
        # @return [String]
        attr_accessor :oauth_scope
      
        # The OAuth1 access token secret.
        # Corresponds to the JSON property `oauthTokenSecret`
        # @return [String]
        attr_accessor :oauth_token_secret
      
        # The original email stored in the mapping storage. It's returned when the
        # federated ID is associated to a different email.
        # Corresponds to the JSON property `originalEmail`
        # @return [String]
        attr_accessor :original_email
      
        # The URI of the public accessible profiel picture.
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # The IdP ID. For white listed IdPs it's a short domain name e.g. google.com,
        # aol.com, live.net and yahoo.com. If the "providerId" param is set to OpenID OP
        # identifer other than the whilte listed IdPs the OP identifier is returned. If
        # the "identifier" param is federated ID in the createAuthUri request. The
        # domain part of the federated ID is returned.
        # Corresponds to the JSON property `providerId`
        # @return [String]
        attr_accessor :provider_id
      
        # Raw IDP-returned user info.
        # Corresponds to the JSON property `rawUserInfo`
        # @return [String]
        attr_accessor :raw_user_info
      
        # If idToken is STS id token, then this field will be refresh token.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        # The screen_name of a Twitter user or the login name at Github.
        # Corresponds to the JSON property `screenName`
        # @return [String]
        attr_accessor :screen_name
      
        # The timezone of the user.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        # When action is 'map', contains the idps which can be used for confirmation.
        # Corresponds to the JSON property `verifiedProvider`
        # @return [Array<String>]
        attr_accessor :verified_provider
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @app_installation_url = args[:app_installation_url] if args.key?(:app_installation_url)
          @app_scheme = args[:app_scheme] if args.key?(:app_scheme)
          @context = args[:context] if args.key?(:context)
          @date_of_birth = args[:date_of_birth] if args.key?(:date_of_birth)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @email_recycled = args[:email_recycled] if args.key?(:email_recycled)
          @email_verified = args[:email_verified] if args.key?(:email_verified)
          @error_message = args[:error_message] if args.key?(:error_message)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @federated_id = args[:federated_id] if args.key?(:federated_id)
          @first_name = args[:first_name] if args.key?(:first_name)
          @full_name = args[:full_name] if args.key?(:full_name)
          @id_token = args[:id_token] if args.key?(:id_token)
          @input_email = args[:input_email] if args.key?(:input_email)
          @is_new_user = args[:is_new_user] if args.key?(:is_new_user)
          @kind = args[:kind] if args.key?(:kind)
          @language = args[:language] if args.key?(:language)
          @last_name = args[:last_name] if args.key?(:last_name)
          @local_id = args[:local_id] if args.key?(:local_id)
          @need_confirmation = args[:need_confirmation] if args.key?(:need_confirmation)
          @need_email = args[:need_email] if args.key?(:need_email)
          @nick_name = args[:nick_name] if args.key?(:nick_name)
          @oauth_access_token = args[:oauth_access_token] if args.key?(:oauth_access_token)
          @oauth_authorization_code = args[:oauth_authorization_code] if args.key?(:oauth_authorization_code)
          @oauth_expire_in = args[:oauth_expire_in] if args.key?(:oauth_expire_in)
          @oauth_id_token = args[:oauth_id_token] if args.key?(:oauth_id_token)
          @oauth_request_token = args[:oauth_request_token] if args.key?(:oauth_request_token)
          @oauth_scope = args[:oauth_scope] if args.key?(:oauth_scope)
          @oauth_token_secret = args[:oauth_token_secret] if args.key?(:oauth_token_secret)
          @original_email = args[:original_email] if args.key?(:original_email)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @provider_id = args[:provider_id] if args.key?(:provider_id)
          @raw_user_info = args[:raw_user_info] if args.key?(:raw_user_info)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
          @screen_name = args[:screen_name] if args.key?(:screen_name)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
          @verified_provider = args[:verified_provider] if args.key?(:verified_provider)
        end
      end
      
      # Response from verifying a custom token
      class VerifyCustomTokenResponse
        include Google::Apis::Core::Hashable
      
        # If idToken is STS id token, then this field will be expiration time of STS id
        # token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The GITKit token for authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # True if it's a new user sign-in, false if it's a returning user.
        # Corresponds to the JSON property `isNewUser`
        # @return [Boolean]
        attr_accessor :is_new_user
        alias_method :is_new_user?, :is_new_user
      
        # The fixed string "identitytoolkit#VerifyCustomTokenResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # If idToken is STS id token, then this field will be refresh token.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @is_new_user = args[:is_new_user] if args.key?(:is_new_user)
          @kind = args[:kind] if args.key?(:kind)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
        end
      end
      
      # Request of verifying the password.
      class VerifyPasswordResponse
        include Google::Apis::Core::Hashable
      
        # The name of the user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email returned by the IdP. NOTE: The federated login user may not own the
        # email.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # If idToken is STS id token, then this field will be expiration time of STS id
        # token in seconds.
        # Corresponds to the JSON property `expiresIn`
        # @return [Fixnum]
        attr_accessor :expires_in
      
        # The GITKit token for authenticated user.
        # Corresponds to the JSON property `idToken`
        # @return [String]
        attr_accessor :id_token
      
        # The fixed string "identitytoolkit#VerifyPasswordResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The RP local ID if it's already been mapped to the IdP account identified by
        # the federated ID.
        # Corresponds to the JSON property `localId`
        # @return [String]
        attr_accessor :local_id
      
        # The OAuth2 access token.
        # Corresponds to the JSON property `oauthAccessToken`
        # @return [String]
        attr_accessor :oauth_access_token
      
        # The OAuth2 authorization code.
        # Corresponds to the JSON property `oauthAuthorizationCode`
        # @return [String]
        attr_accessor :oauth_authorization_code
      
        # The lifetime in seconds of the OAuth2 access token.
        # Corresponds to the JSON property `oauthExpireIn`
        # @return [Fixnum]
        attr_accessor :oauth_expire_in
      
        # The URI of the user's photo at IdP
        # Corresponds to the JSON property `photoUrl`
        # @return [String]
        attr_accessor :photo_url
      
        # If idToken is STS id token, then this field will be refresh token.
        # Corresponds to the JSON property `refreshToken`
        # @return [String]
        attr_accessor :refresh_token
      
        # Whether the email is registered.
        # Corresponds to the JSON property `registered`
        # @return [Boolean]
        attr_accessor :registered
        alias_method :registered?, :registered
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email = args[:email] if args.key?(:email)
          @expires_in = args[:expires_in] if args.key?(:expires_in)
          @id_token = args[:id_token] if args.key?(:id_token)
          @kind = args[:kind] if args.key?(:kind)
          @local_id = args[:local_id] if args.key?(:local_id)
          @oauth_access_token = args[:oauth_access_token] if args.key?(:oauth_access_token)
          @oauth_authorization_code = args[:oauth_authorization_code] if args.key?(:oauth_authorization_code)
          @oauth_expire_in = args[:oauth_expire_in] if args.key?(:oauth_expire_in)
          @photo_url = args[:photo_url] if args.key?(:photo_url)
          @refresh_token = args[:refresh_token] if args.key?(:refresh_token)
          @registered = args[:registered] if args.key?(:registered)
        end
      end
    end
  end
end
