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
    module OsloginV1alpha
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportSshPublicKeyResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoginProfile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PosixAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SshPublicKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ImportSshPublicKeyResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :login_profile, as: 'loginProfile', class: Google::Apis::OsloginV1alpha::LoginProfile, decorator: Google::Apis::OsloginV1alpha::LoginProfile::Representation
      
        end
      end
      
      class LoginProfile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :posix_accounts, as: 'posixAccounts', class: Google::Apis::OsloginV1alpha::PosixAccount, decorator: Google::Apis::OsloginV1alpha::PosixAccount::Representation
      
          hash :ssh_public_keys, as: 'sshPublicKeys', class: Google::Apis::OsloginV1alpha::SshPublicKey, decorator: Google::Apis::OsloginV1alpha::SshPublicKey::Representation
      
        end
      end
      
      class PosixAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :gecos, as: 'gecos'
          property :gid, :numeric_string => true, as: 'gid'
          property :home_directory, as: 'homeDirectory'
          property :name, as: 'name'
          property :operating_system_type, as: 'operatingSystemType'
          property :primary, as: 'primary'
          property :shell, as: 'shell'
          property :system_id, as: 'systemId'
          property :uid, :numeric_string => true, as: 'uid'
          property :username, as: 'username'
        end
      end
      
      class SshPublicKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_time_usec, :numeric_string => true, as: 'expirationTimeUsec'
          property :fingerprint, as: 'fingerprint'
          property :key, as: 'key'
          property :name, as: 'name'
        end
      end
    end
  end
end
