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
    module SqladminV1beta4
      
      class AclEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApiWarning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackupConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackupRun
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListBackupRunsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BinLogCoordinates
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloneContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Database
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatabaseFlags
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DatabaseInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class FailoverReplica
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDatabasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DemoteMasterConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DemoteMasterContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DemoteMasterMySqlReplicaConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskEncryptionConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DiskEncryptionStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExportContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class CsvExportOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class SqlExportOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class MysqlExportOptions
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FailoverContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Flag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFlagsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BakImportOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class EncryptionOptions
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class CsvImportOptions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CloneInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesDemoteMasterRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExportInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesFailoverRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ImportInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesListServerCasResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RestoreInstancesBackupRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesRotateServerCaRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InstancesTruncateLogRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IpConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IpMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LocationPreference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MaintenanceWindow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MySqlReplicaConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OnPremisesConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationErrors
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReplicaConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RestoreBackupContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RotateServerCaContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Settings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCert
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SslCertsCreateEphemeralRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertSslCertsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InsertSslCertsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSslCertsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tier
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTiersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TruncateLogContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListUsersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AclEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_time, as: 'expirationTime', type: DateTime
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class ApiWarning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :message, as: 'message'
        end
      end
      
      class BackupConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary_log_enabled, as: 'binaryLogEnabled'
          property :enabled, as: 'enabled'
          property :kind, as: 'kind'
          property :location, as: 'location'
          property :replication_log_archiving_enabled, as: 'replicationLogArchivingEnabled'
          property :start_time, as: 'startTime'
        end
      end
      
      class BackupRun
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :disk_encryption_configuration, as: 'diskEncryptionConfiguration', class: Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration, decorator: Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration::Representation
      
          property :disk_encryption_status, as: 'diskEncryptionStatus', class: Google::Apis::SqladminV1beta4::DiskEncryptionStatus, decorator: Google::Apis::SqladminV1beta4::DiskEncryptionStatus::Representation
      
          property :end_time, as: 'endTime', type: DateTime
      
          property :enqueued_time, as: 'enqueuedTime', type: DateTime
      
          property :error, as: 'error', class: Google::Apis::SqladminV1beta4::OperationError, decorator: Google::Apis::SqladminV1beta4::OperationError::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :instance, as: 'instance'
          property :kind, as: 'kind'
          property :location, as: 'location'
          property :self_link, as: 'selfLink'
          property :start_time, as: 'startTime', type: DateTime
      
          property :status, as: 'status'
          property :type, as: 'type'
          property :window_start_time, as: 'windowStartTime', type: DateTime
      
        end
      end
      
      class ListBackupRunsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::BackupRun, decorator: Google::Apis::SqladminV1beta4::BackupRun::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class BinLogCoordinates
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bin_log_file_name, as: 'binLogFileName'
          property :bin_log_position, :numeric_string => true, as: 'binLogPosition'
          property :kind, as: 'kind'
        end
      end
      
      class CloneContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bin_log_coordinates, as: 'binLogCoordinates', class: Google::Apis::SqladminV1beta4::BinLogCoordinates, decorator: Google::Apis::SqladminV1beta4::BinLogCoordinates::Representation
      
          property :destination_instance_name, as: 'destinationInstanceName'
          property :kind, as: 'kind'
          property :pitr_timestamp_ms, :numeric_string => true, as: 'pitrTimestampMs'
        end
      end
      
      class Database
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :charset, as: 'charset'
          property :collation, as: 'collation'
          property :etag, as: 'etag'
          property :instance, as: 'instance'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :project, as: 'project'
          property :self_link, as: 'selfLink'
        end
      end
      
      class DatabaseFlags
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class DatabaseInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backend_type, as: 'backendType'
          property :connection_name, as: 'connectionName'
          property :current_disk_size, :numeric_string => true, as: 'currentDiskSize'
          property :database_version, as: 'databaseVersion'
          property :disk_encryption_configuration, as: 'diskEncryptionConfiguration', class: Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration, decorator: Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration::Representation
      
          property :disk_encryption_status, as: 'diskEncryptionStatus', class: Google::Apis::SqladminV1beta4::DiskEncryptionStatus, decorator: Google::Apis::SqladminV1beta4::DiskEncryptionStatus::Representation
      
          property :etag, as: 'etag'
          property :failover_replica, as: 'failoverReplica', class: Google::Apis::SqladminV1beta4::DatabaseInstance::FailoverReplica, decorator: Google::Apis::SqladminV1beta4::DatabaseInstance::FailoverReplica::Representation
      
          property :gce_zone, as: 'gceZone'
          property :instance_type, as: 'instanceType'
          collection :ip_addresses, as: 'ipAddresses', class: Google::Apis::SqladminV1beta4::IpMapping, decorator: Google::Apis::SqladminV1beta4::IpMapping::Representation
      
          property :ipv6_address, as: 'ipv6Address'
          property :kind, as: 'kind'
          property :master_instance_name, as: 'masterInstanceName'
          property :max_disk_size, :numeric_string => true, as: 'maxDiskSize'
          property :name, as: 'name'
          property :on_premises_configuration, as: 'onPremisesConfiguration', class: Google::Apis::SqladminV1beta4::OnPremisesConfiguration, decorator: Google::Apis::SqladminV1beta4::OnPremisesConfiguration::Representation
      
          property :project, as: 'project'
          property :region, as: 'region'
          property :replica_configuration, as: 'replicaConfiguration', class: Google::Apis::SqladminV1beta4::ReplicaConfiguration, decorator: Google::Apis::SqladminV1beta4::ReplicaConfiguration::Representation
      
          collection :replica_names, as: 'replicaNames'
          property :root_password, as: 'rootPassword'
          property :self_link, as: 'selfLink'
          property :server_ca_cert, as: 'serverCaCert', class: Google::Apis::SqladminV1beta4::SslCert, decorator: Google::Apis::SqladminV1beta4::SslCert::Representation
      
          property :service_account_email_address, as: 'serviceAccountEmailAddress'
          property :settings, as: 'settings', class: Google::Apis::SqladminV1beta4::Settings, decorator: Google::Apis::SqladminV1beta4::Settings::Representation
      
          property :state, as: 'state'
          collection :suspension_reason, as: 'suspensionReason'
        end
        
        class FailoverReplica
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :available, as: 'available'
            property :name, as: 'name'
          end
        end
      end
      
      class ListDatabasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::Database, decorator: Google::Apis::SqladminV1beta4::Database::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class DemoteMasterConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :mysql_replica_configuration, as: 'mysqlReplicaConfiguration', class: Google::Apis::SqladminV1beta4::DemoteMasterMySqlReplicaConfiguration, decorator: Google::Apis::SqladminV1beta4::DemoteMasterMySqlReplicaConfiguration::Representation
      
        end
      end
      
      class DemoteMasterContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :master_instance_name, as: 'masterInstanceName'
          property :replica_configuration, as: 'replicaConfiguration', class: Google::Apis::SqladminV1beta4::DemoteMasterConfiguration, decorator: Google::Apis::SqladminV1beta4::DemoteMasterConfiguration::Representation
      
          property :verify_gtid_consistency, as: 'verifyGtidConsistency'
        end
      end
      
      class DemoteMasterMySqlReplicaConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ca_certificate, as: 'caCertificate'
          property :client_certificate, as: 'clientCertificate'
          property :client_key, as: 'clientKey'
          property :kind, as: 'kind'
          property :password, as: 'password'
          property :username, as: 'username'
        end
      end
      
      class DiskEncryptionConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :kms_key_name, as: 'kmsKeyName'
        end
      end
      
      class DiskEncryptionStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :kms_key_version_name, as: 'kmsKeyVersionName'
        end
      end
      
      class ExportContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :csv_export_options, as: 'csvExportOptions', class: Google::Apis::SqladminV1beta4::ExportContext::CsvExportOptions, decorator: Google::Apis::SqladminV1beta4::ExportContext::CsvExportOptions::Representation
      
          collection :databases, as: 'databases'
          property :file_type, as: 'fileType'
          property :kind, as: 'kind'
          property :sql_export_options, as: 'sqlExportOptions', class: Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions, decorator: Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions::Representation
      
          property :uri, as: 'uri'
        end
        
        class CsvExportOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :select_query, as: 'selectQuery'
          end
        end
        
        class SqlExportOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :mysql_export_options, as: 'mysqlExportOptions', class: Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions::MysqlExportOptions, decorator: Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions::MysqlExportOptions::Representation
        
            property :schema_only, as: 'schemaOnly'
            collection :tables, as: 'tables'
          end
          
          class MysqlExportOptions
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :master_data, as: 'masterData'
            end
          end
        end
      end
      
      class FailoverContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :settings_version, :numeric_string => true, as: 'settingsVersion'
        end
      end
      
      class Flag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed_string_values, as: 'allowedStringValues'
          collection :applies_to, as: 'appliesTo'
          property :in_beta, as: 'inBeta'
          property :kind, as: 'kind'
          property :max_value, :numeric_string => true, as: 'maxValue'
          property :min_value, :numeric_string => true, as: 'minValue'
          property :name, as: 'name'
          property :requires_restart, as: 'requiresRestart'
          property :type, as: 'type'
        end
      end
      
      class ListFlagsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::Flag, decorator: Google::Apis::SqladminV1beta4::Flag::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ImportContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bak_import_options, as: 'bakImportOptions', class: Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions, decorator: Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions::Representation
      
          property :csv_import_options, as: 'csvImportOptions', class: Google::Apis::SqladminV1beta4::ImportContext::CsvImportOptions, decorator: Google::Apis::SqladminV1beta4::ImportContext::CsvImportOptions::Representation
      
          property :database, as: 'database'
          property :file_type, as: 'fileType'
          property :import_user, as: 'importUser'
          property :kind, as: 'kind'
          property :uri, as: 'uri'
        end
        
        class BakImportOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :encryption_options, as: 'encryptionOptions', class: Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions::EncryptionOptions, decorator: Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions::EncryptionOptions::Representation
        
          end
          
          class EncryptionOptions
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :cert_path, as: 'certPath'
              property :pvk_password, as: 'pvkPassword'
              property :pvk_path, as: 'pvkPath'
            end
          end
        end
        
        class CsvImportOptions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :columns, as: 'columns'
            property :table, as: 'table'
          end
        end
      end
      
      class CloneInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :clone_context, as: 'cloneContext', class: Google::Apis::SqladminV1beta4::CloneContext, decorator: Google::Apis::SqladminV1beta4::CloneContext::Representation
      
        end
      end
      
      class InstancesDemoteMasterRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :demote_master_context, as: 'demoteMasterContext', class: Google::Apis::SqladminV1beta4::DemoteMasterContext, decorator: Google::Apis::SqladminV1beta4::DemoteMasterContext::Representation
      
        end
      end
      
      class ExportInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :export_context, as: 'exportContext', class: Google::Apis::SqladminV1beta4::ExportContext, decorator: Google::Apis::SqladminV1beta4::ExportContext::Representation
      
        end
      end
      
      class InstancesFailoverRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failover_context, as: 'failoverContext', class: Google::Apis::SqladminV1beta4::FailoverContext, decorator: Google::Apis::SqladminV1beta4::FailoverContext::Representation
      
        end
      end
      
      class ImportInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :import_context, as: 'importContext', class: Google::Apis::SqladminV1beta4::ImportContext, decorator: Google::Apis::SqladminV1beta4::ImportContext::Representation
      
        end
      end
      
      class ListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::DatabaseInstance, decorator: Google::Apis::SqladminV1beta4::DatabaseInstance::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :warnings, as: 'warnings', class: Google::Apis::SqladminV1beta4::ApiWarning, decorator: Google::Apis::SqladminV1beta4::ApiWarning::Representation
      
        end
      end
      
      class InstancesListServerCasResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_version, as: 'activeVersion'
          collection :certs, as: 'certs', class: Google::Apis::SqladminV1beta4::SslCert, decorator: Google::Apis::SqladminV1beta4::SslCert::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class RestoreInstancesBackupRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :restore_backup_context, as: 'restoreBackupContext', class: Google::Apis::SqladminV1beta4::RestoreBackupContext, decorator: Google::Apis::SqladminV1beta4::RestoreBackupContext::Representation
      
        end
      end
      
      class InstancesRotateServerCaRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :rotate_server_ca_context, as: 'rotateServerCaContext', class: Google::Apis::SqladminV1beta4::RotateServerCaContext, decorator: Google::Apis::SqladminV1beta4::RotateServerCaContext::Representation
      
        end
      end
      
      class InstancesTruncateLogRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :truncate_log_context, as: 'truncateLogContext', class: Google::Apis::SqladminV1beta4::TruncateLogContext, decorator: Google::Apis::SqladminV1beta4::TruncateLogContext::Representation
      
        end
      end
      
      class IpConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :authorized_networks, as: 'authorizedNetworks', class: Google::Apis::SqladminV1beta4::AclEntry, decorator: Google::Apis::SqladminV1beta4::AclEntry::Representation
      
          property :ipv4_enabled, as: 'ipv4Enabled'
          property :private_network, as: 'privateNetwork'
          property :require_ssl, as: 'requireSsl'
        end
      end
      
      class IpMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ip_address, as: 'ipAddress'
          property :time_to_retire, as: 'timeToRetire', type: DateTime
      
          property :type, as: 'type'
        end
      end
      
      class LocationPreference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :follow_gae_application, as: 'followGaeApplication'
          property :kind, as: 'kind'
          property :zone, as: 'zone'
        end
      end
      
      class MaintenanceWindow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :hour, as: 'hour'
          property :kind, as: 'kind'
          property :update_track, as: 'updateTrack'
        end
      end
      
      class MySqlReplicaConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ca_certificate, as: 'caCertificate'
          property :client_certificate, as: 'clientCertificate'
          property :client_key, as: 'clientKey'
          property :connect_retry_interval, as: 'connectRetryInterval'
          property :dump_file_path, as: 'dumpFilePath'
          property :kind, as: 'kind'
          property :master_heartbeat_period, :numeric_string => true, as: 'masterHeartbeatPeriod'
          property :password, as: 'password'
          property :ssl_cipher, as: 'sslCipher'
          property :username, as: 'username'
          property :verify_server_certificate, as: 'verifyServerCertificate'
        end
      end
      
      class OnPremisesConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :host_port, as: 'hostPort'
          property :kind, as: 'kind'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_time, as: 'endTime', type: DateTime
      
          property :error, as: 'error', class: Google::Apis::SqladminV1beta4::OperationErrors, decorator: Google::Apis::SqladminV1beta4::OperationErrors::Representation
      
          property :export_context, as: 'exportContext', class: Google::Apis::SqladminV1beta4::ExportContext, decorator: Google::Apis::SqladminV1beta4::ExportContext::Representation
      
          property :import_context, as: 'importContext', class: Google::Apis::SqladminV1beta4::ImportContext, decorator: Google::Apis::SqladminV1beta4::ImportContext::Representation
      
          property :insert_time, as: 'insertTime', type: DateTime
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :operation_type, as: 'operationType'
          property :self_link, as: 'selfLink'
          property :start_time, as: 'startTime', type: DateTime
      
          property :status, as: 'status'
          property :target_id, as: 'targetId'
          property :target_link, as: 'targetLink'
          property :target_project, as: 'targetProject'
          property :user, as: 'user'
        end
      end
      
      class OperationError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :kind, as: 'kind'
          property :message, as: 'message'
        end
      end
      
      class OperationErrors
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :errors, as: 'errors', class: Google::Apis::SqladminV1beta4::OperationError, decorator: Google::Apis::SqladminV1beta4::OperationError::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::Operation, decorator: Google::Apis::SqladminV1beta4::Operation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ReplicaConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :failover_target, as: 'failoverTarget'
          property :kind, as: 'kind'
          property :mysql_replica_configuration, as: 'mysqlReplicaConfiguration', class: Google::Apis::SqladminV1beta4::MySqlReplicaConfiguration, decorator: Google::Apis::SqladminV1beta4::MySqlReplicaConfiguration::Representation
      
        end
      end
      
      class RestoreBackupContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :backup_run_id, :numeric_string => true, as: 'backupRunId'
          property :instance_id, as: 'instanceId'
          property :kind, as: 'kind'
          property :project, as: 'project'
        end
      end
      
      class RotateServerCaContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_version, as: 'nextVersion'
        end
      end
      
      class Settings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :activation_policy, as: 'activationPolicy'
          collection :authorized_gae_applications, as: 'authorizedGaeApplications'
          property :availability_type, as: 'availabilityType'
          property :backup_configuration, as: 'backupConfiguration', class: Google::Apis::SqladminV1beta4::BackupConfiguration, decorator: Google::Apis::SqladminV1beta4::BackupConfiguration::Representation
      
          property :crash_safe_replication_enabled, as: 'crashSafeReplicationEnabled'
          property :data_disk_size_gb, :numeric_string => true, as: 'dataDiskSizeGb'
          property :data_disk_type, as: 'dataDiskType'
          collection :database_flags, as: 'databaseFlags', class: Google::Apis::SqladminV1beta4::DatabaseFlags, decorator: Google::Apis::SqladminV1beta4::DatabaseFlags::Representation
      
          property :database_replication_enabled, as: 'databaseReplicationEnabled'
          property :ip_configuration, as: 'ipConfiguration', class: Google::Apis::SqladminV1beta4::IpConfiguration, decorator: Google::Apis::SqladminV1beta4::IpConfiguration::Representation
      
          property :kind, as: 'kind'
          property :location_preference, as: 'locationPreference', class: Google::Apis::SqladminV1beta4::LocationPreference, decorator: Google::Apis::SqladminV1beta4::LocationPreference::Representation
      
          property :maintenance_window, as: 'maintenanceWindow', class: Google::Apis::SqladminV1beta4::MaintenanceWindow, decorator: Google::Apis::SqladminV1beta4::MaintenanceWindow::Representation
      
          property :pricing_plan, as: 'pricingPlan'
          property :replication_type, as: 'replicationType'
          property :settings_version, :numeric_string => true, as: 'settingsVersion'
          property :storage_auto_resize, as: 'storageAutoResize'
          property :storage_auto_resize_limit, :numeric_string => true, as: 'storageAutoResizeLimit'
          property :tier, as: 'tier'
          hash :user_labels, as: 'userLabels'
        end
      end
      
      class SslCert
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cert, as: 'cert'
          property :cert_serial_number, as: 'certSerialNumber'
          property :common_name, as: 'commonName'
          property :create_time, as: 'createTime', type: DateTime
      
          property :expiration_time, as: 'expirationTime', type: DateTime
      
          property :instance, as: 'instance'
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
          property :sha1_fingerprint, as: 'sha1Fingerprint'
        end
      end
      
      class SslCertDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cert_info, as: 'certInfo', class: Google::Apis::SqladminV1beta4::SslCert, decorator: Google::Apis::SqladminV1beta4::SslCert::Representation
      
          property :cert_private_key, as: 'certPrivateKey'
        end
      end
      
      class SslCertsCreateEphemeralRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :public_key, as: 'public_key'
        end
      end
      
      class InsertSslCertsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common_name, as: 'commonName'
        end
      end
      
      class InsertSslCertsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_cert, as: 'clientCert', class: Google::Apis::SqladminV1beta4::SslCertDetail, decorator: Google::Apis::SqladminV1beta4::SslCertDetail::Representation
      
          property :kind, as: 'kind'
          property :operation, as: 'operation', class: Google::Apis::SqladminV1beta4::Operation, decorator: Google::Apis::SqladminV1beta4::Operation::Representation
      
          property :server_ca_cert, as: 'serverCaCert', class: Google::Apis::SqladminV1beta4::SslCert, decorator: Google::Apis::SqladminV1beta4::SslCert::Representation
      
        end
      end
      
      class ListSslCertsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::SslCert, decorator: Google::Apis::SqladminV1beta4::SslCert::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Tier
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disk_quota, :numeric_string => true, as: 'DiskQuota'
          property :ram, :numeric_string => true, as: 'RAM'
          property :kind, as: 'kind'
          collection :region, as: 'region'
          property :tier, as: 'tier'
        end
      end
      
      class ListTiersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::Tier, decorator: Google::Apis::SqladminV1beta4::Tier::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class TruncateLogContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :log_type, as: 'logType'
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :host, as: 'host'
          property :instance, as: 'instance'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :password, as: 'password'
          property :project, as: 'project'
        end
      end
      
      class ListUsersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::SqladminV1beta4::User, decorator: Google::Apis::SqladminV1beta4::User::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
