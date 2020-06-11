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
      
      # An entry for an Access Control list.
      class AclEntry
        include Google::Apis::Core::Hashable
      
        # The time when this access control entry expires in RFC 3339 format, for
        # example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `expirationTime`
        # @return [DateTime]
        attr_accessor :expiration_time
      
        # This is always sql#aclEntry.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An optional label to identify this entry.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The whitelisted value for the access control list.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # An Admin API warning message.
      class ApiWarning
        include Google::Apis::Core::Hashable
      
        # Code to uniquely identify the warning type.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # The warning message.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Database instance backup configuration.
      class BackupConfiguration
        include Google::Apis::Core::Hashable
      
        # Whether binary log is enabled. If backup configuration is disabled, binary log
        # must be disabled as well.
        # Corresponds to the JSON property `binaryLogEnabled`
        # @return [Boolean]
        attr_accessor :binary_log_enabled
        alias_method :binary_log_enabled?, :binary_log_enabled
      
        # Whether this configuration is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # This is always sql#backupConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The location of the backup.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Reserved for future use.
        # Corresponds to the JSON property `replicationLogArchivingEnabled`
        # @return [Boolean]
        attr_accessor :replication_log_archiving_enabled
        alias_method :replication_log_archiving_enabled?, :replication_log_archiving_enabled
      
        # Start time for the daily backup configuration in UTC timezone in the 24 hour
        # format - HH:MM.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @binary_log_enabled = args[:binary_log_enabled] if args.key?(:binary_log_enabled)
          @enabled = args[:enabled] if args.key?(:enabled)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @replication_log_archiving_enabled = args[:replication_log_archiving_enabled] if args.key?(:replication_log_archiving_enabled)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A BackupRun resource.
      class BackupRun
        include Google::Apis::Core::Hashable
      
        # The description of this run, only applicable to on-demand backups.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Disk encryption configuration.
        # Corresponds to the JSON property `diskEncryptionConfiguration`
        # @return [Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration]
        attr_accessor :disk_encryption_configuration
      
        # Disk encryption status.
        # Corresponds to the JSON property `diskEncryptionStatus`
        # @return [Google::Apis::SqladminV1beta4::DiskEncryptionStatus]
        attr_accessor :disk_encryption_status
      
        # The time the backup operation completed in UTC timezone in RFC 3339 format,
        # for example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `endTime`
        # @return [DateTime]
        attr_accessor :end_time
      
        # The time the run was enqueued in UTC timezone in RFC 3339 format, for example
        # 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `enqueuedTime`
        # @return [DateTime]
        attr_accessor :enqueued_time
      
        # Database instance operation error.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::SqladminV1beta4::OperationError]
        attr_accessor :error
      
        # The identifier for this backup run. Unique only for a specific Cloud SQL
        # instance.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of the database instance.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # This is always sql#backupRun.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The location of the backup.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The URI of this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The time the backup operation actually started in UTC timezone in RFC 3339
        # format, for example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # The status of this run.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The type of this run; can be either "AUTOMATED" or "ON_DEMAND".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The start time of the backup window during which this the backup was attempted
        # in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `windowStartTime`
        # @return [DateTime]
        attr_accessor :window_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @disk_encryption_configuration = args[:disk_encryption_configuration] if args.key?(:disk_encryption_configuration)
          @disk_encryption_status = args[:disk_encryption_status] if args.key?(:disk_encryption_status)
          @end_time = args[:end_time] if args.key?(:end_time)
          @enqueued_time = args[:enqueued_time] if args.key?(:enqueued_time)
          @error = args[:error] if args.key?(:error)
          @id = args[:id] if args.key?(:id)
          @instance = args[:instance] if args.key?(:instance)
          @kind = args[:kind] if args.key?(:kind)
          @location = args[:location] if args.key?(:location)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
          @window_start_time = args[:window_start_time] if args.key?(:window_start_time)
        end
      end
      
      # Backup run list results.
      class ListBackupRunsResponse
        include Google::Apis::Core::Hashable
      
        # A list of backup runs in reverse chronological order of the enqueued time.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::BackupRun>]
        attr_accessor :items
      
        # This is always sql#backupRunsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Binary log coordinates.
      class BinLogCoordinates
        include Google::Apis::Core::Hashable
      
        # Name of the binary log file for a Cloud SQL instance.
        # Corresponds to the JSON property `binLogFileName`
        # @return [String]
        attr_accessor :bin_log_file_name
      
        # Position (offset) within the binary log file.
        # Corresponds to the JSON property `binLogPosition`
        # @return [Fixnum]
        attr_accessor :bin_log_position
      
        # This is always sql#binLogCoordinates.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bin_log_file_name = args[:bin_log_file_name] if args.key?(:bin_log_file_name)
          @bin_log_position = args[:bin_log_position] if args.key?(:bin_log_position)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Database instance clone context.
      class CloneContext
        include Google::Apis::Core::Hashable
      
        # Binary log coordinates.
        # Corresponds to the JSON property `binLogCoordinates`
        # @return [Google::Apis::SqladminV1beta4::BinLogCoordinates]
        attr_accessor :bin_log_coordinates
      
        # Name of the Cloud SQL instance to be created as a clone.
        # Corresponds to the JSON property `destinationInstanceName`
        # @return [String]
        attr_accessor :destination_instance_name
      
        # This is always sql#cloneContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Reserved for future use.
        # Corresponds to the JSON property `pitrTimestampMs`
        # @return [Fixnum]
        attr_accessor :pitr_timestamp_ms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bin_log_coordinates = args[:bin_log_coordinates] if args.key?(:bin_log_coordinates)
          @destination_instance_name = args[:destination_instance_name] if args.key?(:destination_instance_name)
          @kind = args[:kind] if args.key?(:kind)
          @pitr_timestamp_ms = args[:pitr_timestamp_ms] if args.key?(:pitr_timestamp_ms)
        end
      end
      
      # Represents a SQL database on the Cloud SQL instance.
      class Database
        include Google::Apis::Core::Hashable
      
        # The MySQL charset value.
        # Corresponds to the JSON property `charset`
        # @return [String]
        attr_accessor :charset
      
        # The MySQL collation value.
        # Corresponds to the JSON property `collation`
        # @return [String]
        attr_accessor :collation
      
        # This field is deprecated and will be removed from a future version of the API.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The name of the Cloud SQL instance. This does not include the project ID.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # This is always sql#database.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the database in the Cloud SQL instance. This does not include the
        # project ID or instance name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The project ID of the project containing the Cloud SQL database. The Google
        # apps domain is prefixed if applicable.
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        # The URI of this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @charset = args[:charset] if args.key?(:charset)
          @collation = args[:collation] if args.key?(:collation)
          @etag = args[:etag] if args.key?(:etag)
          @instance = args[:instance] if args.key?(:instance)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @project = args[:project] if args.key?(:project)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # Database flags for Cloud SQL instances.
      class DatabaseFlags
        include Google::Apis::Core::Hashable
      
        # The name of the flag. These flags are passed at instance startup, so include
        # both server options and system variables for MySQL. Flags should be specified
        # with underscores, not hyphens. For more information, see Configuring Database
        # Flags in the Cloud SQL documentation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The value of the flag. Booleans should be set to on for true and off for false.
        # This field must be omitted if the flag doesn't take a value.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A Cloud SQL instance resource.
      class DatabaseInstance
        include Google::Apis::Core::Hashable
      
        # FIRST_GEN: First Generation instance. MySQL only.
        # SECOND_GEN: Second Generation instance or PostgreSQL instance.
        # EXTERNAL: A database server that is not managed by Google.
        # This property is read-only; use the tier property in the settings object to
        # determine the database type and Second or First Generation.
        # Corresponds to the JSON property `backendType`
        # @return [String]
        attr_accessor :backend_type
      
        # Connection name of the Cloud SQL instance used in connection strings.
        # Corresponds to the JSON property `connectionName`
        # @return [String]
        attr_accessor :connection_name
      
        # The current disk usage of the instance in bytes. This property has been
        # deprecated. Users should use the "cloudsql.googleapis.com/database/disk/
        # bytes_used" metric in Cloud Monitoring API instead. Please see this
        # announcement for details.
        # Corresponds to the JSON property `currentDiskSize`
        # @return [Fixnum]
        attr_accessor :current_disk_size
      
        # The database engine type and version. The databaseVersion field can not be
        # changed after instance creation. MySQL Second Generation instances: MYSQL_5_7 (
        # default) or MYSQL_5_6. PostgreSQL instances: POSTGRES_9_6 (default) or
        # POSTGRES_11 Beta. MySQL First Generation instances: MYSQL_5_6 (default) or
        # MYSQL_5_5
        # Corresponds to the JSON property `databaseVersion`
        # @return [String]
        attr_accessor :database_version
      
        # Disk encryption configuration.
        # Corresponds to the JSON property `diskEncryptionConfiguration`
        # @return [Google::Apis::SqladminV1beta4::DiskEncryptionConfiguration]
        attr_accessor :disk_encryption_configuration
      
        # Disk encryption status.
        # Corresponds to the JSON property `diskEncryptionStatus`
        # @return [Google::Apis::SqladminV1beta4::DiskEncryptionStatus]
        attr_accessor :disk_encryption_status
      
        # This field is deprecated and will be removed from a future version of the API.
        # Use the settings.settingsVersion field instead.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The name and status of the failover replica. This property is applicable only
        # to Second Generation instances.
        # Corresponds to the JSON property `failoverReplica`
        # @return [Google::Apis::SqladminV1beta4::DatabaseInstance::FailoverReplica]
        attr_accessor :failover_replica
      
        # The Compute Engine zone that the instance is currently serving from. This
        # value could be different from the zone that was specified when the instance
        # was created if the instance has failed over to its secondary zone.
        # Corresponds to the JSON property `gceZone`
        # @return [String]
        attr_accessor :gce_zone
      
        # The instance type. This can be one of the following.
        # CLOUD_SQL_INSTANCE: A Cloud SQL instance that is not replicating from a master.
        # ON_PREMISES_INSTANCE: An instance running on the customer's premises.
        # READ_REPLICA_INSTANCE: A Cloud SQL instance configured as a read-replica.
        # Corresponds to the JSON property `instanceType`
        # @return [String]
        attr_accessor :instance_type
      
        # The assigned IP addresses for the instance.
        # Corresponds to the JSON property `ipAddresses`
        # @return [Array<Google::Apis::SqladminV1beta4::IpMapping>]
        attr_accessor :ip_addresses
      
        # The IPv6 address assigned to the instance. This property is applicable only to
        # First Generation instances.
        # Corresponds to the JSON property `ipv6Address`
        # @return [String]
        attr_accessor :ipv6_address
      
        # This is always sql#instance.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the instance which will act as master in the replication setup.
        # Corresponds to the JSON property `masterInstanceName`
        # @return [String]
        attr_accessor :master_instance_name
      
        # The maximum disk size of the instance in bytes.
        # Corresponds to the JSON property `maxDiskSize`
        # @return [Fixnum]
        attr_accessor :max_disk_size
      
        # Name of the Cloud SQL instance. This does not include the project ID.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # On-premises instance configuration.
        # Corresponds to the JSON property `onPremisesConfiguration`
        # @return [Google::Apis::SqladminV1beta4::OnPremisesConfiguration]
        attr_accessor :on_premises_configuration
      
        # The project ID of the project containing the Cloud SQL instance. The Google
        # apps domain is prefixed if applicable.
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        # The geographical region. Can be us-central (FIRST_GEN instances only), us-
        # central1 (SECOND_GEN instances only), asia-east1 or europe-west1. Defaults to
        # us-central or us-central1 depending on the instance type (First Generation or
        # Second Generation). The region can not be changed after instance creation.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Read-replica configuration for connecting to the master.
        # Corresponds to the JSON property `replicaConfiguration`
        # @return [Google::Apis::SqladminV1beta4::ReplicaConfiguration]
        attr_accessor :replica_configuration
      
        # The replicas of the instance.
        # Corresponds to the JSON property `replicaNames`
        # @return [Array<String>]
        attr_accessor :replica_names
      
        # Initial root password. Use only on creation.
        # Corresponds to the JSON property `rootPassword`
        # @return [String]
        attr_accessor :root_password
      
        # The URI of this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # SslCerts Resource
        # Corresponds to the JSON property `serverCaCert`
        # @return [Google::Apis::SqladminV1beta4::SslCert]
        attr_accessor :server_ca_cert
      
        # The service account email address assigned to the instance. This property is
        # applicable only to Second Generation instances.
        # Corresponds to the JSON property `serviceAccountEmailAddress`
        # @return [String]
        attr_accessor :service_account_email_address
      
        # Database instance settings.
        # Corresponds to the JSON property `settings`
        # @return [Google::Apis::SqladminV1beta4::Settings]
        attr_accessor :settings
      
        # The current serving state of the Cloud SQL instance. This can be one of the
        # following.
        # RUNNABLE: The instance is running, or is ready to run when accessed.
        # SUSPENDED: The instance is not available, for example due to problems with
        # billing.
        # PENDING_CREATE: The instance is being created.
        # MAINTENANCE: The instance is down for maintenance.
        # FAILED: The instance creation failed.
        # UNKNOWN_STATE: The state of the instance is unknown.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # If the instance state is SUSPENDED, the reason for the suspension.
        # Corresponds to the JSON property `suspensionReason`
        # @return [Array<String>]
        attr_accessor :suspension_reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @backend_type = args[:backend_type] if args.key?(:backend_type)
          @connection_name = args[:connection_name] if args.key?(:connection_name)
          @current_disk_size = args[:current_disk_size] if args.key?(:current_disk_size)
          @database_version = args[:database_version] if args.key?(:database_version)
          @disk_encryption_configuration = args[:disk_encryption_configuration] if args.key?(:disk_encryption_configuration)
          @disk_encryption_status = args[:disk_encryption_status] if args.key?(:disk_encryption_status)
          @etag = args[:etag] if args.key?(:etag)
          @failover_replica = args[:failover_replica] if args.key?(:failover_replica)
          @gce_zone = args[:gce_zone] if args.key?(:gce_zone)
          @instance_type = args[:instance_type] if args.key?(:instance_type)
          @ip_addresses = args[:ip_addresses] if args.key?(:ip_addresses)
          @ipv6_address = args[:ipv6_address] if args.key?(:ipv6_address)
          @kind = args[:kind] if args.key?(:kind)
          @master_instance_name = args[:master_instance_name] if args.key?(:master_instance_name)
          @max_disk_size = args[:max_disk_size] if args.key?(:max_disk_size)
          @name = args[:name] if args.key?(:name)
          @on_premises_configuration = args[:on_premises_configuration] if args.key?(:on_premises_configuration)
          @project = args[:project] if args.key?(:project)
          @region = args[:region] if args.key?(:region)
          @replica_configuration = args[:replica_configuration] if args.key?(:replica_configuration)
          @replica_names = args[:replica_names] if args.key?(:replica_names)
          @root_password = args[:root_password] if args.key?(:root_password)
          @self_link = args[:self_link] if args.key?(:self_link)
          @server_ca_cert = args[:server_ca_cert] if args.key?(:server_ca_cert)
          @service_account_email_address = args[:service_account_email_address] if args.key?(:service_account_email_address)
          @settings = args[:settings] if args.key?(:settings)
          @state = args[:state] if args.key?(:state)
          @suspension_reason = args[:suspension_reason] if args.key?(:suspension_reason)
        end
        
        # The name and status of the failover replica. This property is applicable only
        # to Second Generation instances.
        class FailoverReplica
          include Google::Apis::Core::Hashable
        
          # The availability status of the failover replica. A false status indicates that
          # the failover replica is out of sync. The master can only failover to the
          # falover replica when the status is true.
          # Corresponds to the JSON property `available`
          # @return [Boolean]
          attr_accessor :available
          alias_method :available?, :available
        
          # The name of the failover replica. If specified at instance creation, a
          # failover replica is created for the instance. The name doesn't include the
          # project ID. This property is applicable only to Second Generation instances.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @available = args[:available] if args.key?(:available)
            @name = args[:name] if args.key?(:name)
          end
        end
      end
      
      # Database list response.
      class ListDatabasesResponse
        include Google::Apis::Core::Hashable
      
        # List of database resources in the instance.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::Database>]
        attr_accessor :items
      
        # This is always sql#databasesList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Read-replica configuration for connecting to the on-premises master.
      class DemoteMasterConfiguration
        include Google::Apis::Core::Hashable
      
        # This is always sql#demoteMasterConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Read-replica configuration specific to MySQL databases.
        # Corresponds to the JSON property `mysqlReplicaConfiguration`
        # @return [Google::Apis::SqladminV1beta4::DemoteMasterMySqlReplicaConfiguration]
        attr_accessor :mysql_replica_configuration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @mysql_replica_configuration = args[:mysql_replica_configuration] if args.key?(:mysql_replica_configuration)
        end
      end
      
      # Database instance demote master context.
      class DemoteMasterContext
        include Google::Apis::Core::Hashable
      
        # This is always sql#demoteMasterContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the instance which will act as on-premises master in the
        # replication setup.
        # Corresponds to the JSON property `masterInstanceName`
        # @return [String]
        attr_accessor :master_instance_name
      
        # Read-replica configuration for connecting to the on-premises master.
        # Corresponds to the JSON property `replicaConfiguration`
        # @return [Google::Apis::SqladminV1beta4::DemoteMasterConfiguration]
        attr_accessor :replica_configuration
      
        # Verify GTID consistency for demote operation. Default value: True. Second
        # Generation instances only. Setting this flag to false enables you to bypass
        # GTID consistency check between on-premises master and Cloud SQL instance
        # during the demotion operation but also exposes you to the risk of future
        # replication failures. Change the value only if you know the reason for the
        # GTID divergence and are confident that doing so will not cause any replication
        # issues.
        # Corresponds to the JSON property `verifyGtidConsistency`
        # @return [Boolean]
        attr_accessor :verify_gtid_consistency
        alias_method :verify_gtid_consistency?, :verify_gtid_consistency
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @master_instance_name = args[:master_instance_name] if args.key?(:master_instance_name)
          @replica_configuration = args[:replica_configuration] if args.key?(:replica_configuration)
          @verify_gtid_consistency = args[:verify_gtid_consistency] if args.key?(:verify_gtid_consistency)
        end
      end
      
      # Read-replica configuration specific to MySQL databases.
      class DemoteMasterMySqlReplicaConfiguration
        include Google::Apis::Core::Hashable
      
        # PEM representation of the trusted CA's x509 certificate.
        # Corresponds to the JSON property `caCertificate`
        # @return [String]
        attr_accessor :ca_certificate
      
        # PEM representation of the slave's x509 certificate.
        # Corresponds to the JSON property `clientCertificate`
        # @return [String]
        attr_accessor :client_certificate
      
        # PEM representation of the slave's private key. The corresponsing public key is
        # encoded in the client's certificate. The format of the slave's private key can
        # be either PKCS #1 or PKCS #8.
        # Corresponds to the JSON property `clientKey`
        # @return [String]
        attr_accessor :client_key
      
        # This is always sql#demoteMasterMysqlReplicaConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The password for the replication connection.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The username for the replication connection.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ca_certificate = args[:ca_certificate] if args.key?(:ca_certificate)
          @client_certificate = args[:client_certificate] if args.key?(:client_certificate)
          @client_key = args[:client_key] if args.key?(:client_key)
          @kind = args[:kind] if args.key?(:kind)
          @password = args[:password] if args.key?(:password)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # Disk encryption configuration.
      class DiskEncryptionConfiguration
        include Google::Apis::Core::Hashable
      
        # This is always sql#diskEncryptionConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # KMS key resource name
        # Corresponds to the JSON property `kmsKeyName`
        # @return [String]
        attr_accessor :kms_key_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @kms_key_name = args[:kms_key_name] if args.key?(:kms_key_name)
        end
      end
      
      # Disk encryption status.
      class DiskEncryptionStatus
        include Google::Apis::Core::Hashable
      
        # This is always sql#diskEncryptionStatus.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # KMS key version used to encrypt the Cloud SQL instance disk
        # Corresponds to the JSON property `kmsKeyVersionName`
        # @return [String]
        attr_accessor :kms_key_version_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @kms_key_version_name = args[:kms_key_version_name] if args.key?(:kms_key_version_name)
        end
      end
      
      # Database instance export context.
      class ExportContext
        include Google::Apis::Core::Hashable
      
        # Options for exporting data as CSV.
        # Corresponds to the JSON property `csvExportOptions`
        # @return [Google::Apis::SqladminV1beta4::ExportContext::CsvExportOptions]
        attr_accessor :csv_export_options
      
        # Databases to be exported.
        # MySQL instances: If fileType is SQL and no database is specified, all
        # databases are exported, except for the mysql system database. If fileType is
        # CSV, you can specify one database, either by using this property or by using
        # the csvExportOptions.selectQuery property, which takes precedence over this
        # property.
        # PostgreSQL instances: Specify exactly one database to be exported. If fileType
        # is CSV, this database must match the database used in the csvExportOptions.
        # selectQuery property.
        # Corresponds to the JSON property `databases`
        # @return [Array<String>]
        attr_accessor :databases
      
        # The file type for the specified uri.
        # SQL: The file contains SQL statements.
        # CSV: The file contains CSV data.
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # This is always sql#exportContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Options for exporting data as SQL statements.
        # Corresponds to the JSON property `sqlExportOptions`
        # @return [Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions]
        attr_accessor :sql_export_options
      
        # The path to the file in Google Cloud Storage where the export will be stored.
        # The URI is in the form gs://bucketName/fileName. If the file already exists,
        # the requests succeeds, but the operation fails. If fileType is SQL and the
        # filename ends with .gz, the contents are compressed.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @csv_export_options = args[:csv_export_options] if args.key?(:csv_export_options)
          @databases = args[:databases] if args.key?(:databases)
          @file_type = args[:file_type] if args.key?(:file_type)
          @kind = args[:kind] if args.key?(:kind)
          @sql_export_options = args[:sql_export_options] if args.key?(:sql_export_options)
          @uri = args[:uri] if args.key?(:uri)
        end
        
        # Options for exporting data as CSV.
        class CsvExportOptions
          include Google::Apis::Core::Hashable
        
          # The select query used to extract the data.
          # Corresponds to the JSON property `selectQuery`
          # @return [String]
          attr_accessor :select_query
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @select_query = args[:select_query] if args.key?(:select_query)
          end
        end
        
        # Options for exporting data as SQL statements.
        class SqlExportOptions
          include Google::Apis::Core::Hashable
        
          # Options for exporting from MySQL.
          # Corresponds to the JSON property `mysqlExportOptions`
          # @return [Google::Apis::SqladminV1beta4::ExportContext::SqlExportOptions::MysqlExportOptions]
          attr_accessor :mysql_export_options
        
          # Export only schemas.
          # Corresponds to the JSON property `schemaOnly`
          # @return [Boolean]
          attr_accessor :schema_only
          alias_method :schema_only?, :schema_only
        
          # Tables to export, or that were exported, from the specified database. If you
          # specify tables, specify one and only one database. For PostgreSQL instances,
          # you can specify only one table.
          # Corresponds to the JSON property `tables`
          # @return [Array<String>]
          attr_accessor :tables
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @mysql_export_options = args[:mysql_export_options] if args.key?(:mysql_export_options)
            @schema_only = args[:schema_only] if args.key?(:schema_only)
            @tables = args[:tables] if args.key?(:tables)
          end
          
          # Options for exporting from MySQL.
          class MysqlExportOptions
            include Google::Apis::Core::Hashable
          
            # Option to include SQL statement required to set up replication. If set to 1,
            # the dump file includes a CHANGE MASTER TO statement with the binary log
            # coordinates. If set to 2, the CHANGE MASTER TO statement is written as a SQL
            # comment, and has no effect. All other values are ignored.
            # Corresponds to the JSON property `masterData`
            # @return [Fixnum]
            attr_accessor :master_data
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @master_data = args[:master_data] if args.key?(:master_data)
            end
          end
        end
      end
      
      # Database instance failover context.
      class FailoverContext
        include Google::Apis::Core::Hashable
      
        # This is always sql#failoverContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The current settings version of this instance. Request will be rejected if
        # this version doesn't match the current settings version.
        # Corresponds to the JSON property `settingsVersion`
        # @return [Fixnum]
        attr_accessor :settings_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @settings_version = args[:settings_version] if args.key?(:settings_version)
        end
      end
      
      # A flag resource.
      class Flag
        include Google::Apis::Core::Hashable
      
        # For STRING flags, a list of strings that the value can be set to.
        # Corresponds to the JSON property `allowedStringValues`
        # @return [Array<String>]
        attr_accessor :allowed_string_values
      
        # The database version this flag applies to. Can be MYSQL_5_5, MYSQL_5_6, or
        # MYSQL_5_7. MYSQL_5_7 is applicable only to Second Generation instances.
        # Corresponds to the JSON property `appliesTo`
        # @return [Array<String>]
        attr_accessor :applies_to
      
        # True if the flag is only released in Beta.
        # Corresponds to the JSON property `inBeta`
        # @return [Boolean]
        attr_accessor :in_beta
        alias_method :in_beta?, :in_beta
      
        # This is always sql#flag.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # For INTEGER flags, the maximum allowed value.
        # Corresponds to the JSON property `maxValue`
        # @return [Fixnum]
        attr_accessor :max_value
      
        # For INTEGER flags, the minimum allowed value.
        # Corresponds to the JSON property `minValue`
        # @return [Fixnum]
        attr_accessor :min_value
      
        # This is the name of the flag. Flag names always use underscores, not hyphens,
        # e.g. max_allowed_packet
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Indicates whether changing this flag will trigger a database restart. Only
        # applicable to Second Generation instances.
        # Corresponds to the JSON property `requiresRestart`
        # @return [Boolean]
        attr_accessor :requires_restart
        alias_method :requires_restart?, :requires_restart
      
        # The type of the flag. Flags are typed to being BOOLEAN, STRING, INTEGER or
        # NONE. NONE is used for flags which do not take a value, such as
        # skip_grant_tables.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed_string_values = args[:allowed_string_values] if args.key?(:allowed_string_values)
          @applies_to = args[:applies_to] if args.key?(:applies_to)
          @in_beta = args[:in_beta] if args.key?(:in_beta)
          @kind = args[:kind] if args.key?(:kind)
          @max_value = args[:max_value] if args.key?(:max_value)
          @min_value = args[:min_value] if args.key?(:min_value)
          @name = args[:name] if args.key?(:name)
          @requires_restart = args[:requires_restart] if args.key?(:requires_restart)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Flags list response.
      class ListFlagsResponse
        include Google::Apis::Core::Hashable
      
        # List of flags.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::Flag>]
        attr_accessor :items
      
        # This is always sql#flagsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Database instance import context.
      class ImportContext
        include Google::Apis::Core::Hashable
      
        # Import parameters specific to SQL Server .BAK files
        # Corresponds to the JSON property `bakImportOptions`
        # @return [Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions]
        attr_accessor :bak_import_options
      
        # Options for importing data as CSV.
        # Corresponds to the JSON property `csvImportOptions`
        # @return [Google::Apis::SqladminV1beta4::ImportContext::CsvImportOptions]
        attr_accessor :csv_import_options
      
        # The target database for the import. If fileType is SQL, this field is required
        # only if the import file does not specify a database, and is overridden by any
        # database specification in the import file. If fileType is CSV, one database
        # must be specified.
        # Corresponds to the JSON property `database`
        # @return [String]
        attr_accessor :database
      
        # The file type for the specified uri.
        # SQL: The file contains SQL statements.
        # CSV: The file contains CSV data.
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # The PostgreSQL user for this import operation. PostgreSQL instances only.
        # Corresponds to the JSON property `importUser`
        # @return [String]
        attr_accessor :import_user
      
        # This is always sql#importContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Path to the import file in Cloud Storage, in the form gs://bucketName/fileName.
        # Compressed gzip files (.gz) are supported when fileType is SQL. The instance
        # must have write permissions to the bucket and read access to the file.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bak_import_options = args[:bak_import_options] if args.key?(:bak_import_options)
          @csv_import_options = args[:csv_import_options] if args.key?(:csv_import_options)
          @database = args[:database] if args.key?(:database)
          @file_type = args[:file_type] if args.key?(:file_type)
          @import_user = args[:import_user] if args.key?(:import_user)
          @kind = args[:kind] if args.key?(:kind)
          @uri = args[:uri] if args.key?(:uri)
        end
        
        # Import parameters specific to SQL Server .BAK files
        class BakImportOptions
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `encryptionOptions`
          # @return [Google::Apis::SqladminV1beta4::ImportContext::BakImportOptions::EncryptionOptions]
          attr_accessor :encryption_options
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @encryption_options = args[:encryption_options] if args.key?(:encryption_options)
          end
          
          # 
          class EncryptionOptions
            include Google::Apis::Core::Hashable
          
            # Path to the Certificate (.cer) in Cloud Storage, in the form gs://bucketName/
            # fileName. The instance must have write permissions to the bucket and read
            # access to the file.
            # Corresponds to the JSON property `certPath`
            # @return [String]
            attr_accessor :cert_path
          
            # Password that encrypts the private key
            # Corresponds to the JSON property `pvkPassword`
            # @return [String]
            attr_accessor :pvk_password
          
            # Path to the Certificate Private Key (.pvk) in Cloud Storage, in the form gs://
            # bucketName/fileName. The instance must have write permissions to the bucket
            # and read access to the file.
            # Corresponds to the JSON property `pvkPath`
            # @return [String]
            attr_accessor :pvk_path
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @cert_path = args[:cert_path] if args.key?(:cert_path)
              @pvk_password = args[:pvk_password] if args.key?(:pvk_password)
              @pvk_path = args[:pvk_path] if args.key?(:pvk_path)
            end
          end
        end
        
        # Options for importing data as CSV.
        class CsvImportOptions
          include Google::Apis::Core::Hashable
        
          # The columns to which CSV data is imported. If not specified, all columns of
          # the database table are loaded with CSV data.
          # Corresponds to the JSON property `columns`
          # @return [Array<String>]
          attr_accessor :columns
        
          # The table to which CSV data is imported.
          # Corresponds to the JSON property `table`
          # @return [String]
          attr_accessor :table
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @columns = args[:columns] if args.key?(:columns)
            @table = args[:table] if args.key?(:table)
          end
        end
      end
      
      # Database instance clone request.
      class CloneInstancesRequest
        include Google::Apis::Core::Hashable
      
        # Database instance clone context.
        # Corresponds to the JSON property `cloneContext`
        # @return [Google::Apis::SqladminV1beta4::CloneContext]
        attr_accessor :clone_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clone_context = args[:clone_context] if args.key?(:clone_context)
        end
      end
      
      # Database demote master request.
      class InstancesDemoteMasterRequest
        include Google::Apis::Core::Hashable
      
        # Database instance demote master context.
        # Corresponds to the JSON property `demoteMasterContext`
        # @return [Google::Apis::SqladminV1beta4::DemoteMasterContext]
        attr_accessor :demote_master_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @demote_master_context = args[:demote_master_context] if args.key?(:demote_master_context)
        end
      end
      
      # Database instance export request.
      class ExportInstancesRequest
        include Google::Apis::Core::Hashable
      
        # Database instance export context.
        # Corresponds to the JSON property `exportContext`
        # @return [Google::Apis::SqladminV1beta4::ExportContext]
        attr_accessor :export_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @export_context = args[:export_context] if args.key?(:export_context)
        end
      end
      
      # Instance failover request.
      class InstancesFailoverRequest
        include Google::Apis::Core::Hashable
      
        # Database instance failover context.
        # Corresponds to the JSON property `failoverContext`
        # @return [Google::Apis::SqladminV1beta4::FailoverContext]
        attr_accessor :failover_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failover_context = args[:failover_context] if args.key?(:failover_context)
        end
      end
      
      # Database instance import request.
      class ImportInstancesRequest
        include Google::Apis::Core::Hashable
      
        # Database instance import context.
        # Corresponds to the JSON property `importContext`
        # @return [Google::Apis::SqladminV1beta4::ImportContext]
        attr_accessor :import_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @import_context = args[:import_context] if args.key?(:import_context)
        end
      end
      
      # Database instances list response.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # List of database instance resources.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::DatabaseInstance>]
        attr_accessor :items
      
        # This is always sql#instancesList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of warnings that ocurred while handling the request.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::SqladminV1beta4::ApiWarning>]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
      end
      
      # Instances ListServerCas response.
      class InstancesListServerCasResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `activeVersion`
        # @return [String]
        attr_accessor :active_version
      
        # List of server CA certificates for the instance.
        # Corresponds to the JSON property `certs`
        # @return [Array<Google::Apis::SqladminV1beta4::SslCert>]
        attr_accessor :certs
      
        # This is always sql#instancesListServerCas.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_version = args[:active_version] if args.key?(:active_version)
          @certs = args[:certs] if args.key?(:certs)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Database instance restore backup request.
      class RestoreInstancesBackupRequest
        include Google::Apis::Core::Hashable
      
        # Database instance restore from backup context.
        # Corresponds to the JSON property `restoreBackupContext`
        # @return [Google::Apis::SqladminV1beta4::RestoreBackupContext]
        attr_accessor :restore_backup_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @restore_backup_context = args[:restore_backup_context] if args.key?(:restore_backup_context)
        end
      end
      
      # Rotate Server CA request.
      class InstancesRotateServerCaRequest
        include Google::Apis::Core::Hashable
      
        # Instance rotate server CA context.
        # Corresponds to the JSON property `rotateServerCaContext`
        # @return [Google::Apis::SqladminV1beta4::RotateServerCaContext]
        attr_accessor :rotate_server_ca_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @rotate_server_ca_context = args[:rotate_server_ca_context] if args.key?(:rotate_server_ca_context)
        end
      end
      
      # Instance truncate log request.
      class InstancesTruncateLogRequest
        include Google::Apis::Core::Hashable
      
        # Database Instance truncate log context.
        # Corresponds to the JSON property `truncateLogContext`
        # @return [Google::Apis::SqladminV1beta4::TruncateLogContext]
        attr_accessor :truncate_log_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @truncate_log_context = args[:truncate_log_context] if args.key?(:truncate_log_context)
        end
      end
      
      # IP Management configuration.
      class IpConfiguration
        include Google::Apis::Core::Hashable
      
        # The list of external networks that are allowed to connect to the instance
        # using the IP. In CIDR notation, also known as 'slash' notation (e.g. 192.168.
        # 100.0/24).
        # Corresponds to the JSON property `authorizedNetworks`
        # @return [Array<Google::Apis::SqladminV1beta4::AclEntry>]
        attr_accessor :authorized_networks
      
        # Whether the instance should be assigned an IP address or not.
        # Corresponds to the JSON property `ipv4Enabled`
        # @return [Boolean]
        attr_accessor :ipv4_enabled
        alias_method :ipv4_enabled?, :ipv4_enabled
      
        # The resource link for the VPC network from which the Cloud SQL instance is
        # accessible for private IP. For example, /projects/myProject/global/networks/
        # default. This setting can be updated, but it cannot be removed after it is set.
        # Corresponds to the JSON property `privateNetwork`
        # @return [String]
        attr_accessor :private_network
      
        # Whether SSL connections over IP should be enforced or not.
        # Corresponds to the JSON property `requireSsl`
        # @return [Boolean]
        attr_accessor :require_ssl
        alias_method :require_ssl?, :require_ssl
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authorized_networks = args[:authorized_networks] if args.key?(:authorized_networks)
          @ipv4_enabled = args[:ipv4_enabled] if args.key?(:ipv4_enabled)
          @private_network = args[:private_network] if args.key?(:private_network)
          @require_ssl = args[:require_ssl] if args.key?(:require_ssl)
        end
      end
      
      # Database instance IP Mapping.
      class IpMapping
        include Google::Apis::Core::Hashable
      
        # The IP address assigned.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # The due time for this IP to be retired in RFC 3339 format, for example 2012-11-
        # 15T16:19:00.094Z. This field is only available when the IP is scheduled to be
        # retired.
        # Corresponds to the JSON property `timeToRetire`
        # @return [DateTime]
        attr_accessor :time_to_retire
      
        # The type of this IP address. A PRIMARY address is a public address that can
        # accept incoming connections. A PRIVATE address is a private address that can
        # accept incoming connections. An OUTGOING address is the source address of
        # connections originating from the instance, if supported.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @time_to_retire = args[:time_to_retire] if args.key?(:time_to_retire)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Preferred location. This specifies where a Cloud SQL instance should
      # preferably be located, either in a specific Compute Engine zone, or co-located
      # with an App Engine application. Note that if the preferred location is not
      # available, the instance will be located as close as possible within the region.
      # Only one location may be specified.
      class LocationPreference
        include Google::Apis::Core::Hashable
      
        # The AppEngine application to follow, it must be in the same region as the
        # Cloud SQL instance.
        # Corresponds to the JSON property `followGaeApplication`
        # @return [String]
        attr_accessor :follow_gae_application
      
        # This is always sql#locationPreference.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The preferred Compute Engine zone (e.g. us-central1-a, us-central1-b, etc.).
        # Corresponds to the JSON property `zone`
        # @return [String]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @follow_gae_application = args[:follow_gae_application] if args.key?(:follow_gae_application)
          @kind = args[:kind] if args.key?(:kind)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Maintenance window. This specifies when a v2 Cloud SQL instance should
      # preferably be restarted for system maintenance purposes.
      class MaintenanceWindow
        include Google::Apis::Core::Hashable
      
        # day of week (1-7), starting on Monday.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # hour of day - 0 to 23.
        # Corresponds to the JSON property `hour`
        # @return [Fixnum]
        attr_accessor :hour
      
        # This is always sql#maintenanceWindow.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Maintenance timing setting: canary (Earlier) or stable (Later).
        # Learn more.
        # Corresponds to the JSON property `updateTrack`
        # @return [String]
        attr_accessor :update_track
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @hour = args[:hour] if args.key?(:hour)
          @kind = args[:kind] if args.key?(:kind)
          @update_track = args[:update_track] if args.key?(:update_track)
        end
      end
      
      # Read-replica configuration specific to MySQL databases.
      class MySqlReplicaConfiguration
        include Google::Apis::Core::Hashable
      
        # PEM representation of the trusted CA's x509 certificate.
        # Corresponds to the JSON property `caCertificate`
        # @return [String]
        attr_accessor :ca_certificate
      
        # PEM representation of the slave's x509 certificate.
        # Corresponds to the JSON property `clientCertificate`
        # @return [String]
        attr_accessor :client_certificate
      
        # PEM representation of the slave's private key. The corresponsing public key is
        # encoded in the client's certificate.
        # Corresponds to the JSON property `clientKey`
        # @return [String]
        attr_accessor :client_key
      
        # Seconds to wait between connect retries. MySQL's default is 60 seconds.
        # Corresponds to the JSON property `connectRetryInterval`
        # @return [Fixnum]
        attr_accessor :connect_retry_interval
      
        # Path to a SQL dump file in Google Cloud Storage from which the slave instance
        # is to be created. The URI is in the form gs://bucketName/fileName. Compressed
        # gzip files (.gz) are also supported. Dumps should have the binlog co-ordinates
        # from which replication should begin. This can be accomplished by setting --
        # master-data to 1 when using mysqldump.
        # Corresponds to the JSON property `dumpFilePath`
        # @return [String]
        attr_accessor :dump_file_path
      
        # This is always sql#mysqlReplicaConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Interval in milliseconds between replication heartbeats.
        # Corresponds to the JSON property `masterHeartbeatPeriod`
        # @return [Fixnum]
        attr_accessor :master_heartbeat_period
      
        # The password for the replication connection.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # A list of permissible ciphers to use for SSL encryption.
        # Corresponds to the JSON property `sslCipher`
        # @return [String]
        attr_accessor :ssl_cipher
      
        # The username for the replication connection.
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        # Whether or not to check the master's Common Name value in the certificate that
        # it sends during the SSL handshake.
        # Corresponds to the JSON property `verifyServerCertificate`
        # @return [Boolean]
        attr_accessor :verify_server_certificate
        alias_method :verify_server_certificate?, :verify_server_certificate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ca_certificate = args[:ca_certificate] if args.key?(:ca_certificate)
          @client_certificate = args[:client_certificate] if args.key?(:client_certificate)
          @client_key = args[:client_key] if args.key?(:client_key)
          @connect_retry_interval = args[:connect_retry_interval] if args.key?(:connect_retry_interval)
          @dump_file_path = args[:dump_file_path] if args.key?(:dump_file_path)
          @kind = args[:kind] if args.key?(:kind)
          @master_heartbeat_period = args[:master_heartbeat_period] if args.key?(:master_heartbeat_period)
          @password = args[:password] if args.key?(:password)
          @ssl_cipher = args[:ssl_cipher] if args.key?(:ssl_cipher)
          @username = args[:username] if args.key?(:username)
          @verify_server_certificate = args[:verify_server_certificate] if args.key?(:verify_server_certificate)
        end
      end
      
      # On-premises instance configuration.
      class OnPremisesConfiguration
        include Google::Apis::Core::Hashable
      
        # The host and port of the on-premises instance in host:port format
        # Corresponds to the JSON property `hostPort`
        # @return [String]
        attr_accessor :host_port
      
        # This is always sql#onPremisesConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @host_port = args[:host_port] if args.key?(:host_port)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # An Operation resource. For successful operations that return an Operation
      # resource, only the fields relevant to the operation are populated in the
      # resource.
      class Operation
        include Google::Apis::Core::Hashable
      
        # The time this operation finished in UTC timezone in RFC 3339 format, for
        # example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `endTime`
        # @return [DateTime]
        attr_accessor :end_time
      
        # Database instance operation errors list wrapper.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::SqladminV1beta4::OperationErrors]
        attr_accessor :error
      
        # Database instance export context.
        # Corresponds to the JSON property `exportContext`
        # @return [Google::Apis::SqladminV1beta4::ExportContext]
        attr_accessor :export_context
      
        # Database instance import context.
        # Corresponds to the JSON property `importContext`
        # @return [Google::Apis::SqladminV1beta4::ImportContext]
        attr_accessor :import_context
      
        # The time this operation was enqueued in UTC timezone in RFC 3339 format, for
        # example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `insertTime`
        # @return [DateTime]
        attr_accessor :insert_time
      
        # This is always sql#operation.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An identifier that uniquely identifies the operation. You can use this
        # identifier to retrieve the Operations resource that has information about the
        # operation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The type of the operation. Valid values are CREATE, DELETE, UPDATE, RESTART,
        # IMPORT, EXPORT, BACKUP_VOLUME, RESTORE_VOLUME, CREATE_USER, DELETE_USER,
        # CREATE_DATABASE, DELETE_DATABASE .
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # The URI of this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The time this operation actually started in UTC timezone in RFC 3339 format,
        # for example 2012-11-15T16:19:00.094Z.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # The status of an operation. Valid values are PENDING, RUNNING, DONE, UNKNOWN.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Name of the database instance related to this operation.
        # Corresponds to the JSON property `targetId`
        # @return [String]
        attr_accessor :target_id
      
        # 
        # Corresponds to the JSON property `targetLink`
        # @return [String]
        attr_accessor :target_link
      
        # The project ID of the target instance related to this operation.
        # Corresponds to the JSON property `targetProject`
        # @return [String]
        attr_accessor :target_project
      
        # The email address of the user who initiated this operation.
        # Corresponds to the JSON property `user`
        # @return [String]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error = args[:error] if args.key?(:error)
          @export_context = args[:export_context] if args.key?(:export_context)
          @import_context = args[:import_context] if args.key?(:import_context)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @target_id = args[:target_id] if args.key?(:target_id)
          @target_link = args[:target_link] if args.key?(:target_link)
          @target_project = args[:target_project] if args.key?(:target_project)
          @user = args[:user] if args.key?(:user)
        end
      end
      
      # Database instance operation error.
      class OperationError
        include Google::Apis::Core::Hashable
      
        # Identifies the specific error that occurred.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # This is always sql#operationError.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Additional information about the error encountered.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @kind = args[:kind] if args.key?(:kind)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Database instance operation errors list wrapper.
      class OperationErrors
        include Google::Apis::Core::Hashable
      
        # The list of errors encountered while processing this operation.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::SqladminV1beta4::OperationError>]
        attr_accessor :errors
      
        # This is always sql#operationErrors.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @errors = args[:errors] if args.key?(:errors)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Database instance list operations response.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # List of operation resources.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::Operation>]
        attr_accessor :items
      
        # This is always sql#operationsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The continuation token, used to page through large result sets. Provide this
        # value in a subsequent request to return the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Read-replica configuration for connecting to the master.
      class ReplicaConfiguration
        include Google::Apis::Core::Hashable
      
        # Specifies if the replica is the failover target. If the field is set to true
        # the replica will be designated as a failover replica. In case the master
        # instance fails, the replica instance will be promoted as the new master
        # instance.
        # Only one replica can be specified as failover target, and the replica has to
        # be in different zone with the master instance.
        # Corresponds to the JSON property `failoverTarget`
        # @return [Boolean]
        attr_accessor :failover_target
        alias_method :failover_target?, :failover_target
      
        # This is always sql#replicaConfiguration.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Read-replica configuration specific to MySQL databases.
        # Corresponds to the JSON property `mysqlReplicaConfiguration`
        # @return [Google::Apis::SqladminV1beta4::MySqlReplicaConfiguration]
        attr_accessor :mysql_replica_configuration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failover_target = args[:failover_target] if args.key?(:failover_target)
          @kind = args[:kind] if args.key?(:kind)
          @mysql_replica_configuration = args[:mysql_replica_configuration] if args.key?(:mysql_replica_configuration)
        end
      end
      
      # Database instance restore from backup context.
      class RestoreBackupContext
        include Google::Apis::Core::Hashable
      
        # The ID of the backup run to restore from.
        # Corresponds to the JSON property `backupRunId`
        # @return [Fixnum]
        attr_accessor :backup_run_id
      
        # The ID of the instance that the backup was taken from.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # This is always sql#restoreBackupContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The full project ID of the source instance.
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @backup_run_id = args[:backup_run_id] if args.key?(:backup_run_id)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @kind = args[:kind] if args.key?(:kind)
          @project = args[:project] if args.key?(:project)
        end
      end
      
      # Instance rotate server CA context.
      class RotateServerCaContext
        include Google::Apis::Core::Hashable
      
        # This is always sql#rotateServerCaContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The fingerprint of the next version to be rotated to. If left unspecified,
        # will be rotated to the most recently added server CA version.
        # Corresponds to the JSON property `nextVersion`
        # @return [String]
        attr_accessor :next_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_version = args[:next_version] if args.key?(:next_version)
        end
      end
      
      # Database instance settings.
      class Settings
        include Google::Apis::Core::Hashable
      
        # The activation policy specifies when the instance is activated; it is
        # applicable only when the instance state is RUNNABLE. Valid values:
        # ALWAYS: The instance is on, and remains so even in the absence of connection
        # requests.
        # NEVER: The instance is off; it is not activated, even if a connection request
        # arrives.
        # ON_DEMAND: First Generation instances only. The instance responds to incoming
        # requests, and turns itself off when not in use. Instances with PER_USE pricing
        # turn off after 15 minutes of inactivity. Instances with PER_PACKAGE pricing
        # turn off after 12 hours of inactivity.
        # Corresponds to the JSON property `activationPolicy`
        # @return [String]
        attr_accessor :activation_policy
      
        # The App Engine app IDs that can access this instance. First Generation
        # instances only.
        # Corresponds to the JSON property `authorizedGaeApplications`
        # @return [Array<String>]
        attr_accessor :authorized_gae_applications
      
        # Availability type (PostgreSQL instances only). Potential values:
        # ZONAL: The instance serves data from only one zone. Outages in that zone
        # affect data accessibility.
        # REGIONAL: The instance can serve data from more than one zone in a region (it
        # is highly available).
        # For more information, see Overview of the High Availability Configuration.
        # Corresponds to the JSON property `availabilityType`
        # @return [String]
        attr_accessor :availability_type
      
        # Database instance backup configuration.
        # Corresponds to the JSON property `backupConfiguration`
        # @return [Google::Apis::SqladminV1beta4::BackupConfiguration]
        attr_accessor :backup_configuration
      
        # Configuration specific to read replica instances. Indicates whether database
        # flags for crash-safe replication are enabled. This property is only applicable
        # to First Generation instances.
        # Corresponds to the JSON property `crashSafeReplicationEnabled`
        # @return [Boolean]
        attr_accessor :crash_safe_replication_enabled
        alias_method :crash_safe_replication_enabled?, :crash_safe_replication_enabled
      
        # The size of data disk, in GB. The data disk size minimum is 10GB. Not used for
        # First Generation instances.
        # Corresponds to the JSON property `dataDiskSizeGb`
        # @return [Fixnum]
        attr_accessor :data_disk_size_gb
      
        # The type of data disk: PD_SSD (default) or PD_HDD. Not used for First
        # Generation instances.
        # Corresponds to the JSON property `dataDiskType`
        # @return [String]
        attr_accessor :data_disk_type
      
        # The database flags passed to the instance at startup.
        # Corresponds to the JSON property `databaseFlags`
        # @return [Array<Google::Apis::SqladminV1beta4::DatabaseFlags>]
        attr_accessor :database_flags
      
        # Configuration specific to read replica instances. Indicates whether
        # replication is enabled or not.
        # Corresponds to the JSON property `databaseReplicationEnabled`
        # @return [Boolean]
        attr_accessor :database_replication_enabled
        alias_method :database_replication_enabled?, :database_replication_enabled
      
        # IP Management configuration.
        # Corresponds to the JSON property `ipConfiguration`
        # @return [Google::Apis::SqladminV1beta4::IpConfiguration]
        attr_accessor :ip_configuration
      
        # This is always sql#settings.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Preferred location. This specifies where a Cloud SQL instance should
        # preferably be located, either in a specific Compute Engine zone, or co-located
        # with an App Engine application. Note that if the preferred location is not
        # available, the instance will be located as close as possible within the region.
        # Only one location may be specified.
        # Corresponds to the JSON property `locationPreference`
        # @return [Google::Apis::SqladminV1beta4::LocationPreference]
        attr_accessor :location_preference
      
        # Maintenance window. This specifies when a v2 Cloud SQL instance should
        # preferably be restarted for system maintenance purposes.
        # Corresponds to the JSON property `maintenanceWindow`
        # @return [Google::Apis::SqladminV1beta4::MaintenanceWindow]
        attr_accessor :maintenance_window
      
        # The pricing plan for this instance. This can be either PER_USE or PACKAGE.
        # Only PER_USE is supported for Second Generation instances.
        # Corresponds to the JSON property `pricingPlan`
        # @return [String]
        attr_accessor :pricing_plan
      
        # The type of replication this instance uses. This can be either ASYNCHRONOUS or
        # SYNCHRONOUS. This property is only applicable to First Generation instances.
        # Corresponds to the JSON property `replicationType`
        # @return [String]
        attr_accessor :replication_type
      
        # The version of instance settings. This is a required field for update method
        # to make sure concurrent updates are handled properly. During update, use the
        # most recent settingsVersion value for this instance and do not try to update
        # this value.
        # Corresponds to the JSON property `settingsVersion`
        # @return [Fixnum]
        attr_accessor :settings_version
      
        # Configuration to increase storage size automatically. The default value is
        # true. Not used for First Generation instances.
        # Corresponds to the JSON property `storageAutoResize`
        # @return [Boolean]
        attr_accessor :storage_auto_resize
        alias_method :storage_auto_resize?, :storage_auto_resize
      
        # The maximum size to which storage capacity can be automatically increased. The
        # default value is 0, which specifies that there is no limit. Not used for First
        # Generation instances.
        # Corresponds to the JSON property `storageAutoResizeLimit`
        # @return [Fixnum]
        attr_accessor :storage_auto_resize_limit
      
        # The tier (or machine type) for this instance, for example db-n1-standard-1 (
        # MySQL instances) or db-custom-1-3840 (PostgreSQL instances). For MySQL
        # instances, this property determines whether the instance is First or Second
        # Generation. For more information, see Instance Settings.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        # User-provided labels, represented as a dictionary where each label is a single
        # key value pair.
        # Corresponds to the JSON property `userLabels`
        # @return [Hash<String,String>]
        attr_accessor :user_labels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @activation_policy = args[:activation_policy] if args.key?(:activation_policy)
          @authorized_gae_applications = args[:authorized_gae_applications] if args.key?(:authorized_gae_applications)
          @availability_type = args[:availability_type] if args.key?(:availability_type)
          @backup_configuration = args[:backup_configuration] if args.key?(:backup_configuration)
          @crash_safe_replication_enabled = args[:crash_safe_replication_enabled] if args.key?(:crash_safe_replication_enabled)
          @data_disk_size_gb = args[:data_disk_size_gb] if args.key?(:data_disk_size_gb)
          @data_disk_type = args[:data_disk_type] if args.key?(:data_disk_type)
          @database_flags = args[:database_flags] if args.key?(:database_flags)
          @database_replication_enabled = args[:database_replication_enabled] if args.key?(:database_replication_enabled)
          @ip_configuration = args[:ip_configuration] if args.key?(:ip_configuration)
          @kind = args[:kind] if args.key?(:kind)
          @location_preference = args[:location_preference] if args.key?(:location_preference)
          @maintenance_window = args[:maintenance_window] if args.key?(:maintenance_window)
          @pricing_plan = args[:pricing_plan] if args.key?(:pricing_plan)
          @replication_type = args[:replication_type] if args.key?(:replication_type)
          @settings_version = args[:settings_version] if args.key?(:settings_version)
          @storage_auto_resize = args[:storage_auto_resize] if args.key?(:storage_auto_resize)
          @storage_auto_resize_limit = args[:storage_auto_resize_limit] if args.key?(:storage_auto_resize_limit)
          @tier = args[:tier] if args.key?(:tier)
          @user_labels = args[:user_labels] if args.key?(:user_labels)
        end
      end
      
      # SslCerts Resource
      class SslCert
        include Google::Apis::Core::Hashable
      
        # PEM representation.
        # Corresponds to the JSON property `cert`
        # @return [String]
        attr_accessor :cert
      
        # Serial number, as extracted from the certificate.
        # Corresponds to the JSON property `certSerialNumber`
        # @return [String]
        attr_accessor :cert_serial_number
      
        # User supplied name. Constrained to [a-zA-Z.-_ ]+.
        # Corresponds to the JSON property `commonName`
        # @return [String]
        attr_accessor :common_name
      
        # The time when the certificate was created in RFC 3339 format, for example 2012-
        # 11-15T16:19:00.094Z
        # Corresponds to the JSON property `createTime`
        # @return [DateTime]
        attr_accessor :create_time
      
        # The time when the certificate expires in RFC 3339 format, for example 2012-11-
        # 15T16:19:00.094Z.
        # Corresponds to the JSON property `expirationTime`
        # @return [DateTime]
        attr_accessor :expiration_time
      
        # Name of the database instance.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # This is always sql#sslCert.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The URI of this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Sha1 Fingerprint.
        # Corresponds to the JSON property `sha1Fingerprint`
        # @return [String]
        attr_accessor :sha1_fingerprint
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cert = args[:cert] if args.key?(:cert)
          @cert_serial_number = args[:cert_serial_number] if args.key?(:cert_serial_number)
          @common_name = args[:common_name] if args.key?(:common_name)
          @create_time = args[:create_time] if args.key?(:create_time)
          @expiration_time = args[:expiration_time] if args.key?(:expiration_time)
          @instance = args[:instance] if args.key?(:instance)
          @kind = args[:kind] if args.key?(:kind)
          @self_link = args[:self_link] if args.key?(:self_link)
          @sha1_fingerprint = args[:sha1_fingerprint] if args.key?(:sha1_fingerprint)
        end
      end
      
      # SslCertDetail.
      class SslCertDetail
        include Google::Apis::Core::Hashable
      
        # SslCerts Resource
        # Corresponds to the JSON property `certInfo`
        # @return [Google::Apis::SqladminV1beta4::SslCert]
        attr_accessor :cert_info
      
        # The private key for the client cert, in pem format. Keep private in order to
        # protect your security.
        # Corresponds to the JSON property `certPrivateKey`
        # @return [String]
        attr_accessor :cert_private_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cert_info = args[:cert_info] if args.key?(:cert_info)
          @cert_private_key = args[:cert_private_key] if args.key?(:cert_private_key)
        end
      end
      
      # SslCerts create ephemeral certificate request.
      class SslCertsCreateEphemeralRequest
        include Google::Apis::Core::Hashable
      
        # PEM encoded public key to include in the signed certificate.
        # Corresponds to the JSON property `public_key`
        # @return [String]
        attr_accessor :public_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @public_key = args[:public_key] if args.key?(:public_key)
        end
      end
      
      # SslCerts insert request.
      class InsertSslCertsRequest
        include Google::Apis::Core::Hashable
      
        # User supplied name. Must be a distinct name from the other certificates for
        # this instance.
        # Corresponds to the JSON property `commonName`
        # @return [String]
        attr_accessor :common_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common_name = args[:common_name] if args.key?(:common_name)
        end
      end
      
      # SslCert insert response.
      class InsertSslCertsResponse
        include Google::Apis::Core::Hashable
      
        # SslCertDetail.
        # Corresponds to the JSON property `clientCert`
        # @return [Google::Apis::SqladminV1beta4::SslCertDetail]
        attr_accessor :client_cert
      
        # This is always sql#sslCertsInsert.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An Operation resource. For successful operations that return an Operation
        # resource, only the fields relevant to the operation are populated in the
        # resource.
        # Corresponds to the JSON property `operation`
        # @return [Google::Apis::SqladminV1beta4::Operation]
        attr_accessor :operation
      
        # SslCerts Resource
        # Corresponds to the JSON property `serverCaCert`
        # @return [Google::Apis::SqladminV1beta4::SslCert]
        attr_accessor :server_ca_cert
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_cert = args[:client_cert] if args.key?(:client_cert)
          @kind = args[:kind] if args.key?(:kind)
          @operation = args[:operation] if args.key?(:operation)
          @server_ca_cert = args[:server_ca_cert] if args.key?(:server_ca_cert)
        end
      end
      
      # SslCerts list response.
      class ListSslCertsResponse
        include Google::Apis::Core::Hashable
      
        # List of client certificates for the instance.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::SslCert>]
        attr_accessor :items
      
        # This is always sql#sslCertsList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A Google Cloud SQL service tier resource.
      class Tier
        include Google::Apis::Core::Hashable
      
        # The maximum disk size of this tier in bytes.
        # Corresponds to the JSON property `DiskQuota`
        # @return [Fixnum]
        attr_accessor :disk_quota
      
        # The maximum RAM usage of this tier in bytes.
        # Corresponds to the JSON property `RAM`
        # @return [Fixnum]
        attr_accessor :ram
      
        # This is always sql#tier.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The applicable regions for this tier.
        # Corresponds to the JSON property `region`
        # @return [Array<String>]
        attr_accessor :region
      
        # An identifier for the machine type, for example, db-n1-standard-1. For related
        # information, see Pricing.
        # Corresponds to the JSON property `tier`
        # @return [String]
        attr_accessor :tier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disk_quota = args[:disk_quota] if args.key?(:disk_quota)
          @ram = args[:ram] if args.key?(:ram)
          @kind = args[:kind] if args.key?(:kind)
          @region = args[:region] if args.key?(:region)
          @tier = args[:tier] if args.key?(:tier)
        end
      end
      
      # Tiers list response.
      class ListTiersResponse
        include Google::Apis::Core::Hashable
      
        # List of tiers.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::Tier>]
        attr_accessor :items
      
        # This is always sql#tiersList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Database Instance truncate log context.
      class TruncateLogContext
        include Google::Apis::Core::Hashable
      
        # This is always sql#truncateLogContext.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The type of log to truncate. Valid values are MYSQL_GENERAL_TABLE and
        # MYSQL_SLOW_TABLE.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # A Cloud SQL user resource.
      class User
        include Google::Apis::Core::Hashable
      
        # This field is deprecated and will be removed from a future version of the API.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The host name from which the user can connect. For insert operations, host
        # defaults to an empty string. For update operations, host is specified as part
        # of the request URL. The host name cannot be updated after insertion.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The name of the Cloud SQL instance. This does not include the project ID. Can
        # be omitted for update since it is already specified on the URL.
        # Corresponds to the JSON property `instance`
        # @return [String]
        attr_accessor :instance
      
        # This is always sql#user.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the user in the Cloud SQL instance. Can be omitted for update
        # since it is already specified in the URL.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The password for the user.
        # Corresponds to the JSON property `password`
        # @return [String]
        attr_accessor :password
      
        # The project ID of the project containing the Cloud SQL database. The Google
        # apps domain is prefixed if applicable. Can be omitted for update since it is
        # already specified on the URL.
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @host = args[:host] if args.key?(:host)
          @instance = args[:instance] if args.key?(:instance)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @password = args[:password] if args.key?(:password)
          @project = args[:project] if args.key?(:project)
        end
      end
      
      # User list response.
      class ListUsersResponse
        include Google::Apis::Core::Hashable
      
        # List of user resources in the instance.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::SqladminV1beta4::User>]
        attr_accessor :items
      
        # This is always sql#usersList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An identifier that uniquely identifies the operation. You can use this
        # identifier to retrieve the Operations resource that has information about the
        # operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
    end
  end
end
