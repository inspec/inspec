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
    module OsloginV1beta
      
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
      
      # A response message for importing an SSH public key.
      class ImportSshPublicKeyResponse
        include Google::Apis::Core::Hashable
      
        # The user profile information used for logging in to a virtual machine on
        # Google Compute Engine.
        # Corresponds to the JSON property `loginProfile`
        # @return [Google::Apis::OsloginV1beta::LoginProfile]
        attr_accessor :login_profile
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @login_profile = args[:login_profile] if args.key?(:login_profile)
        end
      end
      
      # The user profile information used for logging in to a virtual machine on
      # Google Compute Engine.
      class LoginProfile
        include Google::Apis::Core::Hashable
      
        # Required. A unique user ID.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The list of POSIX accounts associated with the user.
        # Corresponds to the JSON property `posixAccounts`
        # @return [Array<Google::Apis::OsloginV1beta::PosixAccount>]
        attr_accessor :posix_accounts
      
        # A map from SSH public key fingerprint to the associated key object.
        # Corresponds to the JSON property `sshPublicKeys`
        # @return [Hash<String,Google::Apis::OsloginV1beta::SshPublicKey>]
        attr_accessor :ssh_public_keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @posix_accounts = args[:posix_accounts] if args.key?(:posix_accounts)
          @ssh_public_keys = args[:ssh_public_keys] if args.key?(:ssh_public_keys)
        end
      end
      
      # The POSIX account information associated with a Google account.
      class PosixAccount
        include Google::Apis::Core::Hashable
      
        # Output only. A POSIX account identifier.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The GECOS (user information) entry for this account.
        # Corresponds to the JSON property `gecos`
        # @return [String]
        attr_accessor :gecos
      
        # The default group ID.
        # Corresponds to the JSON property `gid`
        # @return [Fixnum]
        attr_accessor :gid
      
        # The path to the home directory for this account.
        # Corresponds to the JSON property `homeDirectory`
        # @return [String]
        attr_accessor :home_directory
      
        # Output only. The canonical resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The operating system type where this account applies.
        # Corresponds to the JSON property `operatingSystemType`
        # @return [String]
        attr_accessor :operating_system_type
      
        # Only one POSIX account can be marked as primary.
        # Corresponds to the JSON property `primary`
        # @return [Boolean]
        attr_accessor :primary
        alias_method :primary?, :primary
      
        # The path to the logic shell for this account.
        # Corresponds to the JSON property `shell`
        # @return [String]
        attr_accessor :shell
      
        # System identifier for which account the username or uid applies to.
        # By default, the empty value is used.
        # Corresponds to the JSON property `systemId`
        # @return [String]
        attr_accessor :system_id
      
        # The user ID.
        # Corresponds to the JSON property `uid`
        # @return [Fixnum]
        attr_accessor :uid
      
        # The username of the POSIX account.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @gecos = args[:gecos] if args.key?(:gecos)
          @gid = args[:gid] if args.key?(:gid)
          @home_directory = args[:home_directory] if args.key?(:home_directory)
          @name = args[:name] if args.key?(:name)
          @operating_system_type = args[:operating_system_type] if args.key?(:operating_system_type)
          @primary = args[:primary] if args.key?(:primary)
          @shell = args[:shell] if args.key?(:shell)
          @system_id = args[:system_id] if args.key?(:system_id)
          @uid = args[:uid] if args.key?(:uid)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # The SSH public key information associated with a Google account.
      class SshPublicKey
        include Google::Apis::Core::Hashable
      
        # An expiration time in microseconds since epoch.
        # Corresponds to the JSON property `expirationTimeUsec`
        # @return [Fixnum]
        attr_accessor :expiration_time_usec
      
        # Output only. The SHA-256 fingerprint of the SSH public key.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Public key text in SSH format, defined by
        # <a href="https://www.ietf.org/rfc/rfc4253.txt" target="_blank">RFC4253</a>
        # section 6.6.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Output only. The canonical resource name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration_time_usec = args[:expiration_time_usec] if args.key?(:expiration_time_usec)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @key = args[:key] if args.key?(:key)
          @name = args[:name] if args.key?(:name)
        end
      end
    end
  end
end
