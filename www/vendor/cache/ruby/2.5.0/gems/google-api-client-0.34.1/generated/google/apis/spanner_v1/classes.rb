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
    module SpannerV1
      
      # The request for BatchCreateSessions.
      class BatchCreateSessionsRequest
        include Google::Apis::Core::Hashable
      
        # Required. The number of sessions to be created in this batch call.
        # The API may return fewer than the requested number of sessions. If a
        # specific number of sessions are desired, the client can make additional
        # calls to BatchCreateSessions (adjusting
        # session_count as necessary).
        # Corresponds to the JSON property `sessionCount`
        # @return [Fixnum]
        attr_accessor :session_count
      
        # A session in the Cloud Spanner API.
        # Corresponds to the JSON property `sessionTemplate`
        # @return [Google::Apis::SpannerV1::Session]
        attr_accessor :session_template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @session_count = args[:session_count] if args.key?(:session_count)
          @session_template = args[:session_template] if args.key?(:session_template)
        end
      end
      
      # The response for BatchCreateSessions.
      class BatchCreateSessionsResponse
        include Google::Apis::Core::Hashable
      
        # The freshly created sessions.
        # Corresponds to the JSON property `session`
        # @return [Array<Google::Apis::SpannerV1::Session>]
        attr_accessor :session
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @session = args[:session] if args.key?(:session)
        end
      end
      
      # The request for BeginTransaction.
      class BeginTransactionRequest
        include Google::Apis::Core::Hashable
      
        # # Transactions
        # Each session can have at most one active transaction at a time. After the
        # active transaction is completed, the session can immediately be
        # re-used for the next transaction. It is not necessary to create a
        # new session for each transaction.
        # # Transaction Modes
        # Cloud Spanner supports three transaction modes:
        # 1. Locking read-write. This type of transaction is the only way
        # to write data into Cloud Spanner. These transactions rely on
        # pessimistic locking and, if necessary, two-phase commit.
        # Locking read-write transactions may abort, requiring the
        # application to retry.
        # 2. Snapshot read-only. This transaction type provides guaranteed
        # consistency across several reads, but does not allow
        # writes. Snapshot read-only transactions can be configured to
        # read at timestamps in the past. Snapshot read-only
        # transactions do not need to be committed.
        # 3. Partitioned DML. This type of transaction is used to execute
        # a single Partitioned DML statement. Partitioned DML partitions
        # the key space and runs the DML statement over each partition
        # in parallel using separate, internal transactions that commit
        # independently. Partitioned DML transactions do not need to be
        # committed.
        # For transactions that only read, snapshot read-only transactions
        # provide simpler semantics and are almost always faster. In
        # particular, read-only transactions do not take locks, so they do
        # not conflict with read-write transactions. As a consequence of not
        # taking locks, they also do not abort, so retry loops are not needed.
        # Transactions may only read/write data in a single database. They
        # may, however, read/write data in different tables within that
        # database.
        # ## Locking Read-Write Transactions
        # Locking transactions may be used to atomically read-modify-write
        # data anywhere in a database. This type of transaction is externally
        # consistent.
        # Clients should attempt to minimize the amount of time a transaction
        # is active. Faster transactions commit with higher probability
        # and cause less contention. Cloud Spanner attempts to keep read locks
        # active as long as the transaction continues to do reads, and the
        # transaction has not been terminated by
        # Commit or
        # Rollback.  Long periods of
        # inactivity at the client may cause Cloud Spanner to release a
        # transaction's locks and abort it.
        # Conceptually, a read-write transaction consists of zero or more
        # reads or SQL statements followed by
        # Commit. At any time before
        # Commit, the client can send a
        # Rollback request to abort the
        # transaction.
        # ### Semantics
        # Cloud Spanner can commit the transaction if all read locks it acquired
        # are still valid at commit time, and it is able to acquire write
        # locks for all writes. Cloud Spanner can abort the transaction for any
        # reason. If a commit attempt returns `ABORTED`, Cloud Spanner guarantees
        # that the transaction has not modified any user data in Cloud Spanner.
        # Unless the transaction commits, Cloud Spanner makes no guarantees about
        # how long the transaction's locks were held for. It is an error to
        # use Cloud Spanner locks for any sort of mutual exclusion other than
        # between Cloud Spanner transactions themselves.
        # ### Retrying Aborted Transactions
        # When a transaction aborts, the application can choose to retry the
        # whole transaction again. To maximize the chances of successfully
        # committing the retry, the client should execute the retry in the
        # same session as the original attempt. The original session's lock
        # priority increases with each consecutive abort, meaning that each
        # attempt has a slightly better chance of success than the previous.
        # Under some circumstances (e.g., many transactions attempting to
        # modify the same row(s)), a transaction can abort many times in a
        # short period before successfully committing. Thus, it is not a good
        # idea to cap the number of retries a transaction can attempt;
        # instead, it is better to limit the total amount of wall time spent
        # retrying.
        # ### Idle Transactions
        # A transaction is considered idle if it has no outstanding reads or
        # SQL queries and has not started a read or SQL query within the last 10
        # seconds. Idle transactions can be aborted by Cloud Spanner so that they
        # don't hold on to locks indefinitely. In that case, the commit will
        # fail with error `ABORTED`.
        # If this behavior is undesirable, periodically executing a simple
        # SQL query in the transaction (e.g., `SELECT 1`) prevents the
        # transaction from becoming idle.
        # ## Snapshot Read-Only Transactions
        # Snapshot read-only transactions provides a simpler method than
        # locking read-write transactions for doing several consistent
        # reads. However, this type of transaction does not support writes.
        # Snapshot transactions do not take locks. Instead, they work by
        # choosing a Cloud Spanner timestamp, then executing all reads at that
        # timestamp. Since they do not acquire locks, they do not block
        # concurrent read-write transactions.
        # Unlike locking read-write transactions, snapshot read-only
        # transactions never abort. They can fail if the chosen read
        # timestamp is garbage collected; however, the default garbage
        # collection policy is generous enough that most applications do not
        # need to worry about this in practice.
        # Snapshot read-only transactions do not need to call
        # Commit or
        # Rollback (and in fact are not
        # permitted to do so).
        # To execute a snapshot transaction, the client specifies a timestamp
        # bound, which tells Cloud Spanner how to choose a read timestamp.
        # The types of timestamp bound are:
        # - Strong (the default).
        # - Bounded staleness.
        # - Exact staleness.
        # If the Cloud Spanner database to be read is geographically distributed,
        # stale read-only transactions can execute more quickly than strong
        # or read-write transaction, because they are able to execute far
        # from the leader replica.
        # Each type of timestamp bound is discussed in detail below.
        # ### Strong
        # Strong reads are guaranteed to see the effects of all transactions
        # that have committed before the start of the read. Furthermore, all
        # rows yielded by a single read are consistent with each other -- if
        # any part of the read observes a transaction, all parts of the read
        # see the transaction.
        # Strong reads are not repeatable: two consecutive strong read-only
        # transactions might return inconsistent results if there are
        # concurrent writes. If consistency across reads is required, the
        # reads should be executed within a transaction or at an exact read
        # timestamp.
        # See TransactionOptions.ReadOnly.strong.
        # ### Exact Staleness
        # These timestamp bounds execute reads at a user-specified
        # timestamp. Reads at a timestamp are guaranteed to see a consistent
        # prefix of the global transaction history: they observe
        # modifications done by all transactions with a commit timestamp <=
        # the read timestamp, and observe none of the modifications done by
        # transactions with a larger commit timestamp. They will block until
        # all conflicting transactions that may be assigned commit timestamps
        # <= the read timestamp have finished.
        # The timestamp can either be expressed as an absolute Cloud Spanner commit
        # timestamp or a staleness relative to the current time.
        # These modes do not require a "negotiation phase" to pick a
        # timestamp. As a result, they execute slightly faster than the
        # equivalent boundedly stale concurrency modes. On the other hand,
        # boundedly stale reads usually return fresher results.
        # See TransactionOptions.ReadOnly.read_timestamp and
        # TransactionOptions.ReadOnly.exact_staleness.
        # ### Bounded Staleness
        # Bounded staleness modes allow Cloud Spanner to pick the read timestamp,
        # subject to a user-provided staleness bound. Cloud Spanner chooses the
        # newest timestamp within the staleness bound that allows execution
        # of the reads at the closest available replica without blocking.
        # All rows yielded are consistent with each other -- if any part of
        # the read observes a transaction, all parts of the read see the
        # transaction. Boundedly stale reads are not repeatable: two stale
        # reads, even if they use the same staleness bound, can execute at
        # different timestamps and thus return inconsistent results.
        # Boundedly stale reads execute in two phases: the first phase
        # negotiates a timestamp among all replicas needed to serve the
        # read. In the second phase, reads are executed at the negotiated
        # timestamp.
        # As a result of the two phase execution, bounded staleness reads are
        # usually a little slower than comparable exact staleness
        # reads. However, they are typically able to return fresher
        # results, and are more likely to execute at the closest replica.
        # Because the timestamp negotiation requires up-front knowledge of
        # which rows will be read, it can only be used with single-use
        # read-only transactions.
        # See TransactionOptions.ReadOnly.max_staleness and
        # TransactionOptions.ReadOnly.min_read_timestamp.
        # ### Old Read Timestamps and Garbage Collection
        # Cloud Spanner continuously garbage collects deleted and overwritten data
        # in the background to reclaim storage space. This process is known
        # as "version GC". By default, version GC reclaims versions after they
        # are one hour old. Because of this, Cloud Spanner cannot perform reads
        # at read timestamps more than one hour in the past. This
        # restriction also applies to in-progress reads and/or SQL queries whose
        # timestamp become too old while executing. Reads and SQL queries with
        # too-old read timestamps fail with the error `FAILED_PRECONDITION`.
        # ## Partitioned DML Transactions
        # Partitioned DML transactions are used to execute DML statements with a
        # different execution strategy that provides different, and often better,
        # scalability properties for large, table-wide operations than DML in a
        # ReadWrite transaction. Smaller scoped statements, such as an OLTP workload,
        # should prefer using ReadWrite transactions.
        # Partitioned DML partitions the keyspace and runs the DML statement on each
        # partition in separate, internal transactions. These transactions commit
        # automatically when complete, and run independently from one another.
        # To reduce lock contention, this execution strategy only acquires read locks
        # on rows that match the WHERE clause of the statement. Additionally, the
        # smaller per-partition transactions hold locks for less time.
        # That said, Partitioned DML is not a drop-in replacement for standard DML used
        # in ReadWrite transactions.
        # - The DML statement must be fully-partitionable. Specifically, the statement
        # must be expressible as the union of many statements which each access only
        # a single row of the table.
        # - The statement is not applied atomically to all rows of the table. Rather,
        # the statement is applied atomically to partitions of the table, in
        # independent transactions. Secondary index rows are updated atomically
        # with the base table rows.
        # - Partitioned DML does not guarantee exactly-once execution semantics
        # against a partition. The statement will be applied at least once to each
        # partition. It is strongly recommended that the DML statement should be
        # idempotent to avoid unexpected results. For instance, it is potentially
        # dangerous to run a statement such as
        # `UPDATE table SET column = column + 1` as it could be run multiple times
        # against some rows.
        # - The partitions are committed automatically - there is no support for
        # Commit or Rollback. If the call returns an error, or if the client issuing
        # the ExecuteSql call dies, it is possible that some rows had the statement
        # executed on them successfully. It is also possible that statement was
        # never executed against other rows.
        # - Partitioned DML transactions may only contain the execution of a single
        # DML statement via ExecuteSql or ExecuteStreamingSql.
        # - If any error is encountered during the execution of the partitioned DML
        # operation (for instance, a UNIQUE INDEX violation, division by zero, or a
        # value that cannot be stored due to schema constraints), then the
        # operation is stopped at that point and an error is returned. It is
        # possible that at this point, some partitions have been committed (or even
        # committed multiple times), and other partitions have not been run at all.
        # Given the above, Partitioned DML is good fit for large, database-wide,
        # operations that are idempotent, such as deleting old rows from a very large
        # table.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::SpannerV1::TransactionOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Associates `members` with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::SpannerV1::Expr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Metadata associated with a parent-child relationship appearing in a
      # PlanNode.
      class ChildLink
        include Google::Apis::Core::Hashable
      
        # The node to which the link points.
        # Corresponds to the JSON property `childIndex`
        # @return [Fixnum]
        attr_accessor :child_index
      
        # The type of the link. For example, in Hash Joins this could be used to
        # distinguish between the build child and the probe child, or in the case
        # of the child being an output variable, to represent the tag associated
        # with the output variable.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Only present if the child node is SCALAR and corresponds
        # to an output variable of the parent node. The field carries the name of
        # the output variable.
        # For example, a `TableScan` operator that reads rows from a table will
        # have child links to the `SCALAR` nodes representing the output variables
        # created for each column that is read by the operator. The corresponding
        # `variable` fields will be set to the variable names assigned to the
        # columns.
        # Corresponds to the JSON property `variable`
        # @return [String]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @child_index = args[:child_index] if args.key?(:child_index)
          @type = args[:type] if args.key?(:type)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # The request for Commit.
      class CommitRequest
        include Google::Apis::Core::Hashable
      
        # The mutations to be executed when this transaction commits. All
        # mutations are applied atomically, in the order they appear in
        # this list.
        # Corresponds to the JSON property `mutations`
        # @return [Array<Google::Apis::SpannerV1::Mutation>]
        attr_accessor :mutations
      
        # # Transactions
        # Each session can have at most one active transaction at a time. After the
        # active transaction is completed, the session can immediately be
        # re-used for the next transaction. It is not necessary to create a
        # new session for each transaction.
        # # Transaction Modes
        # Cloud Spanner supports three transaction modes:
        # 1. Locking read-write. This type of transaction is the only way
        # to write data into Cloud Spanner. These transactions rely on
        # pessimistic locking and, if necessary, two-phase commit.
        # Locking read-write transactions may abort, requiring the
        # application to retry.
        # 2. Snapshot read-only. This transaction type provides guaranteed
        # consistency across several reads, but does not allow
        # writes. Snapshot read-only transactions can be configured to
        # read at timestamps in the past. Snapshot read-only
        # transactions do not need to be committed.
        # 3. Partitioned DML. This type of transaction is used to execute
        # a single Partitioned DML statement. Partitioned DML partitions
        # the key space and runs the DML statement over each partition
        # in parallel using separate, internal transactions that commit
        # independently. Partitioned DML transactions do not need to be
        # committed.
        # For transactions that only read, snapshot read-only transactions
        # provide simpler semantics and are almost always faster. In
        # particular, read-only transactions do not take locks, so they do
        # not conflict with read-write transactions. As a consequence of not
        # taking locks, they also do not abort, so retry loops are not needed.
        # Transactions may only read/write data in a single database. They
        # may, however, read/write data in different tables within that
        # database.
        # ## Locking Read-Write Transactions
        # Locking transactions may be used to atomically read-modify-write
        # data anywhere in a database. This type of transaction is externally
        # consistent.
        # Clients should attempt to minimize the amount of time a transaction
        # is active. Faster transactions commit with higher probability
        # and cause less contention. Cloud Spanner attempts to keep read locks
        # active as long as the transaction continues to do reads, and the
        # transaction has not been terminated by
        # Commit or
        # Rollback.  Long periods of
        # inactivity at the client may cause Cloud Spanner to release a
        # transaction's locks and abort it.
        # Conceptually, a read-write transaction consists of zero or more
        # reads or SQL statements followed by
        # Commit. At any time before
        # Commit, the client can send a
        # Rollback request to abort the
        # transaction.
        # ### Semantics
        # Cloud Spanner can commit the transaction if all read locks it acquired
        # are still valid at commit time, and it is able to acquire write
        # locks for all writes. Cloud Spanner can abort the transaction for any
        # reason. If a commit attempt returns `ABORTED`, Cloud Spanner guarantees
        # that the transaction has not modified any user data in Cloud Spanner.
        # Unless the transaction commits, Cloud Spanner makes no guarantees about
        # how long the transaction's locks were held for. It is an error to
        # use Cloud Spanner locks for any sort of mutual exclusion other than
        # between Cloud Spanner transactions themselves.
        # ### Retrying Aborted Transactions
        # When a transaction aborts, the application can choose to retry the
        # whole transaction again. To maximize the chances of successfully
        # committing the retry, the client should execute the retry in the
        # same session as the original attempt. The original session's lock
        # priority increases with each consecutive abort, meaning that each
        # attempt has a slightly better chance of success than the previous.
        # Under some circumstances (e.g., many transactions attempting to
        # modify the same row(s)), a transaction can abort many times in a
        # short period before successfully committing. Thus, it is not a good
        # idea to cap the number of retries a transaction can attempt;
        # instead, it is better to limit the total amount of wall time spent
        # retrying.
        # ### Idle Transactions
        # A transaction is considered idle if it has no outstanding reads or
        # SQL queries and has not started a read or SQL query within the last 10
        # seconds. Idle transactions can be aborted by Cloud Spanner so that they
        # don't hold on to locks indefinitely. In that case, the commit will
        # fail with error `ABORTED`.
        # If this behavior is undesirable, periodically executing a simple
        # SQL query in the transaction (e.g., `SELECT 1`) prevents the
        # transaction from becoming idle.
        # ## Snapshot Read-Only Transactions
        # Snapshot read-only transactions provides a simpler method than
        # locking read-write transactions for doing several consistent
        # reads. However, this type of transaction does not support writes.
        # Snapshot transactions do not take locks. Instead, they work by
        # choosing a Cloud Spanner timestamp, then executing all reads at that
        # timestamp. Since they do not acquire locks, they do not block
        # concurrent read-write transactions.
        # Unlike locking read-write transactions, snapshot read-only
        # transactions never abort. They can fail if the chosen read
        # timestamp is garbage collected; however, the default garbage
        # collection policy is generous enough that most applications do not
        # need to worry about this in practice.
        # Snapshot read-only transactions do not need to call
        # Commit or
        # Rollback (and in fact are not
        # permitted to do so).
        # To execute a snapshot transaction, the client specifies a timestamp
        # bound, which tells Cloud Spanner how to choose a read timestamp.
        # The types of timestamp bound are:
        # - Strong (the default).
        # - Bounded staleness.
        # - Exact staleness.
        # If the Cloud Spanner database to be read is geographically distributed,
        # stale read-only transactions can execute more quickly than strong
        # or read-write transaction, because they are able to execute far
        # from the leader replica.
        # Each type of timestamp bound is discussed in detail below.
        # ### Strong
        # Strong reads are guaranteed to see the effects of all transactions
        # that have committed before the start of the read. Furthermore, all
        # rows yielded by a single read are consistent with each other -- if
        # any part of the read observes a transaction, all parts of the read
        # see the transaction.
        # Strong reads are not repeatable: two consecutive strong read-only
        # transactions might return inconsistent results if there are
        # concurrent writes. If consistency across reads is required, the
        # reads should be executed within a transaction or at an exact read
        # timestamp.
        # See TransactionOptions.ReadOnly.strong.
        # ### Exact Staleness
        # These timestamp bounds execute reads at a user-specified
        # timestamp. Reads at a timestamp are guaranteed to see a consistent
        # prefix of the global transaction history: they observe
        # modifications done by all transactions with a commit timestamp <=
        # the read timestamp, and observe none of the modifications done by
        # transactions with a larger commit timestamp. They will block until
        # all conflicting transactions that may be assigned commit timestamps
        # <= the read timestamp have finished.
        # The timestamp can either be expressed as an absolute Cloud Spanner commit
        # timestamp or a staleness relative to the current time.
        # These modes do not require a "negotiation phase" to pick a
        # timestamp. As a result, they execute slightly faster than the
        # equivalent boundedly stale concurrency modes. On the other hand,
        # boundedly stale reads usually return fresher results.
        # See TransactionOptions.ReadOnly.read_timestamp and
        # TransactionOptions.ReadOnly.exact_staleness.
        # ### Bounded Staleness
        # Bounded staleness modes allow Cloud Spanner to pick the read timestamp,
        # subject to a user-provided staleness bound. Cloud Spanner chooses the
        # newest timestamp within the staleness bound that allows execution
        # of the reads at the closest available replica without blocking.
        # All rows yielded are consistent with each other -- if any part of
        # the read observes a transaction, all parts of the read see the
        # transaction. Boundedly stale reads are not repeatable: two stale
        # reads, even if they use the same staleness bound, can execute at
        # different timestamps and thus return inconsistent results.
        # Boundedly stale reads execute in two phases: the first phase
        # negotiates a timestamp among all replicas needed to serve the
        # read. In the second phase, reads are executed at the negotiated
        # timestamp.
        # As a result of the two phase execution, bounded staleness reads are
        # usually a little slower than comparable exact staleness
        # reads. However, they are typically able to return fresher
        # results, and are more likely to execute at the closest replica.
        # Because the timestamp negotiation requires up-front knowledge of
        # which rows will be read, it can only be used with single-use
        # read-only transactions.
        # See TransactionOptions.ReadOnly.max_staleness and
        # TransactionOptions.ReadOnly.min_read_timestamp.
        # ### Old Read Timestamps and Garbage Collection
        # Cloud Spanner continuously garbage collects deleted and overwritten data
        # in the background to reclaim storage space. This process is known
        # as "version GC". By default, version GC reclaims versions after they
        # are one hour old. Because of this, Cloud Spanner cannot perform reads
        # at read timestamps more than one hour in the past. This
        # restriction also applies to in-progress reads and/or SQL queries whose
        # timestamp become too old while executing. Reads and SQL queries with
        # too-old read timestamps fail with the error `FAILED_PRECONDITION`.
        # ## Partitioned DML Transactions
        # Partitioned DML transactions are used to execute DML statements with a
        # different execution strategy that provides different, and often better,
        # scalability properties for large, table-wide operations than DML in a
        # ReadWrite transaction. Smaller scoped statements, such as an OLTP workload,
        # should prefer using ReadWrite transactions.
        # Partitioned DML partitions the keyspace and runs the DML statement on each
        # partition in separate, internal transactions. These transactions commit
        # automatically when complete, and run independently from one another.
        # To reduce lock contention, this execution strategy only acquires read locks
        # on rows that match the WHERE clause of the statement. Additionally, the
        # smaller per-partition transactions hold locks for less time.
        # That said, Partitioned DML is not a drop-in replacement for standard DML used
        # in ReadWrite transactions.
        # - The DML statement must be fully-partitionable. Specifically, the statement
        # must be expressible as the union of many statements which each access only
        # a single row of the table.
        # - The statement is not applied atomically to all rows of the table. Rather,
        # the statement is applied atomically to partitions of the table, in
        # independent transactions. Secondary index rows are updated atomically
        # with the base table rows.
        # - Partitioned DML does not guarantee exactly-once execution semantics
        # against a partition. The statement will be applied at least once to each
        # partition. It is strongly recommended that the DML statement should be
        # idempotent to avoid unexpected results. For instance, it is potentially
        # dangerous to run a statement such as
        # `UPDATE table SET column = column + 1` as it could be run multiple times
        # against some rows.
        # - The partitions are committed automatically - there is no support for
        # Commit or Rollback. If the call returns an error, or if the client issuing
        # the ExecuteSql call dies, it is possible that some rows had the statement
        # executed on them successfully. It is also possible that statement was
        # never executed against other rows.
        # - Partitioned DML transactions may only contain the execution of a single
        # DML statement via ExecuteSql or ExecuteStreamingSql.
        # - If any error is encountered during the execution of the partitioned DML
        # operation (for instance, a UNIQUE INDEX violation, division by zero, or a
        # value that cannot be stored due to schema constraints), then the
        # operation is stopped at that point and an error is returned. It is
        # possible that at this point, some partitions have been committed (or even
        # committed multiple times), and other partitions have not been run at all.
        # Given the above, Partitioned DML is good fit for large, database-wide,
        # operations that are idempotent, such as deleting old rows from a very large
        # table.
        # Corresponds to the JSON property `singleUseTransaction`
        # @return [Google::Apis::SpannerV1::TransactionOptions]
        attr_accessor :single_use_transaction
      
        # Commit a previously-started transaction.
        # Corresponds to the JSON property `transactionId`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mutations = args[:mutations] if args.key?(:mutations)
          @single_use_transaction = args[:single_use_transaction] if args.key?(:single_use_transaction)
          @transaction_id = args[:transaction_id] if args.key?(:transaction_id)
        end
      end
      
      # The response for Commit.
      class CommitResponse
        include Google::Apis::Core::Hashable
      
        # The Cloud Spanner timestamp at which the transaction committed.
        # Corresponds to the JSON property `commitTimestamp`
        # @return [String]
        attr_accessor :commit_timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commit_timestamp = args[:commit_timestamp] if args.key?(:commit_timestamp)
        end
      end
      
      # Metadata type for the operation returned by
      # CreateDatabase.
      class CreateDatabaseMetadata
        include Google::Apis::Core::Hashable
      
        # The database being created.
        # Corresponds to the JSON property `database`
        # @return [String]
        attr_accessor :database
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @database = args[:database] if args.key?(:database)
        end
      end
      
      # The request for CreateDatabase.
      class CreateDatabaseRequest
        include Google::Apis::Core::Hashable
      
        # Required. A `CREATE DATABASE` statement, which specifies the ID of the
        # new database.  The database ID must conform to the regular expression
        # `a-z*[a-z0-9]` and be between 2 and 30 characters in length.
        # If the database ID is a reserved word or if it contains a hyphen, the
        # database ID must be enclosed in backticks (`` ` ``).
        # Corresponds to the JSON property `createStatement`
        # @return [String]
        attr_accessor :create_statement
      
        # An optional list of DDL statements to run inside the newly created
        # database. Statements can create tables, indexes, etc. These
        # statements execute atomically with the creation of the database:
        # if there is an error in any statement, the database is not created.
        # Corresponds to the JSON property `extraStatements`
        # @return [Array<String>]
        attr_accessor :extra_statements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_statement = args[:create_statement] if args.key?(:create_statement)
          @extra_statements = args[:extra_statements] if args.key?(:extra_statements)
        end
      end
      
      # Metadata type for the operation returned by
      # CreateInstance.
      class CreateInstanceMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which this operation was cancelled. If set, this operation is
        # in the process of undoing itself (which is guaranteed to succeed) and
        # cannot be cancelled again.
        # Corresponds to the JSON property `cancelTime`
        # @return [String]
        attr_accessor :cancel_time
      
        # The time at which this operation failed or was completed successfully.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # An isolated set of Cloud Spanner resources on which databases can be hosted.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::SpannerV1::Instance]
        attr_accessor :instance
      
        # The time at which the
        # CreateInstance request was
        # received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cancel_time = args[:cancel_time] if args.key?(:cancel_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @instance = args[:instance] if args.key?(:instance)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The request for CreateInstance.
      class CreateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # An isolated set of Cloud Spanner resources on which databases can be hosted.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::SpannerV1::Instance]
        attr_accessor :instance
      
        # Required. The ID of the instance to create.  Valid identifiers are of the
        # form `a-z*[a-z0-9]` and must be between 2 and 64 characters in
        # length.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance = args[:instance] if args.key?(:instance)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
        end
      end
      
      # The request for CreateSession.
      class CreateSessionRequest
        include Google::Apis::Core::Hashable
      
        # A session in the Cloud Spanner API.
        # Corresponds to the JSON property `session`
        # @return [Google::Apis::SpannerV1::Session]
        attr_accessor :session
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @session = args[:session] if args.key?(:session)
        end
      end
      
      # A Cloud Spanner database.
      class Database
        include Google::Apis::Core::Hashable
      
        # Required. The name of the database. Values are of the form
        # `projects/<project>/instances/<instance>/databases/<database>`,
        # where `<database>` is as specified in the `CREATE DATABASE`
        # statement. This name can be passed to other API methods to
        # identify the database.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The current database state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Arguments to delete operations.
      class Delete
        include Google::Apis::Core::Hashable
      
        # `KeySet` defines a collection of Cloud Spanner keys and/or key ranges. All
        # the keys are expected to be in the same table or index. The keys need
        # not be sorted in any particular way.
        # If the same key is specified multiple times in the set (for example
        # if two ranges, two keys, or a key and a range overlap), Cloud Spanner
        # behaves as if the key were only specified once.
        # Corresponds to the JSON property `keySet`
        # @return [Google::Apis::SpannerV1::KeySet]
        attr_accessor :key_set
      
        # Required. The table whose rows will be deleted.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key_set = args[:key_set] if args.key?(:key_set)
          @table = args[:table] if args.key?(:table)
        end
      end
      
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
      
      # The request for ExecuteBatchDml.
      class ExecuteBatchDmlRequest
        include Google::Apis::Core::Hashable
      
        # A per-transaction sequence number used to identify this request. This field
        # makes each request idempotent such that if the request is received multiple
        # times, at most one will succeed.
        # The sequence number must be monotonically increasing within the
        # transaction. If a request arrives for the first time with an out-of-order
        # sequence number, the transaction may be aborted. Replays of previously
        # handled requests will yield the same response as the first execution.
        # Corresponds to the JSON property `seqno`
        # @return [Fixnum]
        attr_accessor :seqno
      
        # The list of statements to execute in this batch. Statements are executed
        # serially, such that the effects of statement `i` are visible to statement
        # `i+1`. Each statement must be a DML statement. Execution stops at the
        # first failed statement; the remaining statements are not executed.
        # Callers must provide at least one statement.
        # Corresponds to the JSON property `statements`
        # @return [Array<Google::Apis::SpannerV1::Statement>]
        attr_accessor :statements
      
        # This message is used to select the transaction in which a
        # Read or
        # ExecuteSql call runs.
        # See TransactionOptions for more information about transactions.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::TransactionSelector]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @seqno = args[:seqno] if args.key?(:seqno)
          @statements = args[:statements] if args.key?(:statements)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The response for ExecuteBatchDml. Contains a list
      # of ResultSet messages, one for each DML statement that has successfully
      # executed, in the same order as the statements in the request. If a statement
      # fails, the status in the response body identifies the cause of the failure.
      # To check for DML statements that failed, use the following approach:
      # 1. Check the status in the response message. The google.rpc.Code enum
      # value `OK` indicates that all statements were executed successfully.
      # 2. If the status was not `OK`, check the number of result sets in the
      # response. If the response contains `N` ResultSet messages, then
      # statement `N+1` in the request failed.
      # Example 1:
      # * Request: 5 DML statements, all executed successfully.
      # * Response: 5 ResultSet messages, with the status `OK`.
      # Example 2:
      # * Request: 5 DML statements. The third statement has a syntax error.
      # * Response: 2 ResultSet messages, and a syntax error (`INVALID_ARGUMENT`)
      # status. The number of ResultSet messages indicates that the third
      # statement failed, and the fourth and fifth statements were not executed.
      class ExecuteBatchDmlResponse
        include Google::Apis::Core::Hashable
      
        # One ResultSet for each statement in the request that ran successfully,
        # in the same order as the statements in the request. Each ResultSet does
        # not contain any rows. The ResultSetStats in each ResultSet contain
        # the number of rows modified by the statement.
        # Only the first ResultSet in the response contains valid
        # ResultSetMetadata.
        # Corresponds to the JSON property `resultSets`
        # @return [Array<Google::Apis::SpannerV1::ResultSet>]
        attr_accessor :result_sets
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::SpannerV1::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @result_sets = args[:result_sets] if args.key?(:result_sets)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # The request for ExecuteSql and
      # ExecuteStreamingSql.
      class ExecuteSqlRequest
        include Google::Apis::Core::Hashable
      
        # It is not always possible for Cloud Spanner to infer the right SQL type
        # from a JSON value.  For example, values of type `BYTES` and values
        # of type `STRING` both appear in params as JSON strings.
        # In these cases, `param_types` can be used to specify the exact
        # SQL type for some or all of the SQL statement parameters. See the
        # definition of Type for more information
        # about SQL types.
        # Corresponds to the JSON property `paramTypes`
        # @return [Hash<String,Google::Apis::SpannerV1::Type>]
        attr_accessor :param_types
      
        # Parameter names and values that bind to placeholders in the SQL string.
        # A parameter placeholder consists of the `@` character followed by the
        # parameter name (for example, `@firstName`). Parameter names can contain
        # letters, numbers, and underscores.
        # Parameters can appear anywhere that a literal value is expected.  The same
        # parameter name can be used more than once, for example:
        # `"WHERE id > @msg_id AND id < @msg_id + 100"`
        # It is an error to execute a SQL statement with unbound parameters.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # If present, results will be restricted to the specified partition
        # previously created using PartitionQuery().  There must be an exact
        # match for the values of fields common to this message and the
        # PartitionQueryRequest message used to create this partition_token.
        # Corresponds to the JSON property `partitionToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :partition_token
      
        # Used to control the amount of debugging information returned in
        # ResultSetStats. If partition_token is set, query_mode can only
        # be set to QueryMode.NORMAL.
        # Corresponds to the JSON property `queryMode`
        # @return [String]
        attr_accessor :query_mode
      
        # If this request is resuming a previously interrupted SQL statement
        # execution, `resume_token` should be copied from the last
        # PartialResultSet yielded before the interruption. Doing this
        # enables the new SQL statement execution to resume where the last one left
        # off. The rest of the request parameters must exactly match the
        # request that yielded this token.
        # Corresponds to the JSON property `resumeToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :resume_token
      
        # A per-transaction sequence number used to identify this request. This field
        # makes each request idempotent such that if the request is received multiple
        # times, at most one will succeed.
        # The sequence number must be monotonically increasing within the
        # transaction. If a request arrives for the first time with an out-of-order
        # sequence number, the transaction may be aborted. Replays of previously
        # handled requests will yield the same response as the first execution.
        # Required for DML statements. Ignored for queries.
        # Corresponds to the JSON property `seqno`
        # @return [Fixnum]
        attr_accessor :seqno
      
        # Required. The SQL string.
        # Corresponds to the JSON property `sql`
        # @return [String]
        attr_accessor :sql
      
        # This message is used to select the transaction in which a
        # Read or
        # ExecuteSql call runs.
        # See TransactionOptions for more information about transactions.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::TransactionSelector]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @param_types = args[:param_types] if args.key?(:param_types)
          @params = args[:params] if args.key?(:params)
          @partition_token = args[:partition_token] if args.key?(:partition_token)
          @query_mode = args[:query_mode] if args.key?(:query_mode)
          @resume_token = args[:resume_token] if args.key?(:resume_token)
          @seqno = args[:seqno] if args.key?(:seqno)
          @sql = args[:sql] if args.key?(:sql)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class Expr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Message representing a single field of a struct.
      class Field
        include Google::Apis::Core::Hashable
      
        # The name of the field. For reads, this is the column name. For
        # SQL queries, it is the column alias (e.g., `"Word"` in the
        # query `"SELECT 'hello' AS Word"`), or the column name (e.g.,
        # `"ColName"` in the query `"SELECT ColName FROM Table"`). Some
        # columns might have an empty name (e.g., !"SELECT
        # UPPER(ColName)"`). Note that a query result can contain
        # multiple fields with the same name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # `Type` indicates the type of a Cloud Spanner value, as might be stored in a
        # table cell or returned from an SQL query.
        # Corresponds to the JSON property `type`
        # @return [Google::Apis::SpannerV1::Type]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The response for GetDatabaseDdl.
      class GetDatabaseDdlResponse
        include Google::Apis::Core::Hashable
      
        # A list of formatted DDL statements defining the schema of the database
        # specified in the request.
        # Corresponds to the JSON property `statements`
        # @return [Array<String>]
        attr_accessor :statements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @statements = args[:statements] if args.key?(:statements)
        end
      end
      
      # Request message for `GetIamPolicy` method.
      class GetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates settings provided to GetIamPolicy.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::SpannerV1::GetPolicyOptions]
        attr_accessor :options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @options = args[:options] if args.key?(:options)
        end
      end
      
      # Encapsulates settings provided to GetIamPolicy.
      class GetPolicyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. The policy format version to be returned.
        # Acceptable values are 0, 1, and 3.
        # If the value is 0, or the field is omitted, policy format version 1 will be
        # returned.
        # Corresponds to the JSON property `requestedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :requested_policy_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requested_policy_version = args[:requested_policy_version] if args.key?(:requested_policy_version)
        end
      end
      
      # An isolated set of Cloud Spanner resources on which databases can be hosted.
      class Instance
        include Google::Apis::Core::Hashable
      
        # Required. The name of the instance's configuration. Values are of the form
        # `projects/<project>/instanceConfigs/<configuration>`. See
        # also InstanceConfig and
        # ListInstanceConfigs.
        # Corresponds to the JSON property `config`
        # @return [String]
        attr_accessor :config
      
        # Required. The descriptive name for this instance as it appears in UIs.
        # Must be unique per project and between 4 and 30 characters in length.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cloud Labels are a flexible and lightweight mechanism for organizing cloud
        # resources into groups that reflect a customer's organizational needs and
        # deployment strategies. Cloud Labels can be used to filter collections of
        # resources. They can be used to control how resource metrics are aggregated.
        # And they can be used as arguments to policy management rules (e.g. route,
        # firewall, load balancing, etc.).
        # * Label keys must be between 1 and 63 characters long and must conform to
        # the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`.
        # * Label values must be between 0 and 63 characters long and must conform
        # to the regular expression `([a-z]([-a-z0-9]*[a-z0-9])?)?`.
        # * No more than 64 labels can be associated with a given resource.
        # See https://goo.gl/xmQnxf for more information on and examples of labels.
        # If you plan to use labels in your own code, please note that additional
        # characters may be allowed in the future. And so you are advised to use an
        # internal label representation, such as JSON, which doesn't rely upon
        # specific characters being disallowed.  For example, representing labels
        # as the string:  name + "_" + value  would prove problematic if we were to
        # allow "_" in a future release.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. A unique identifier for the instance, which cannot be changed
        # after the instance is created. Values are of the form
        # `projects/<project>/instances/a-z*[a-z0-9]`. The final
        # segment of the name must be between 2 and 64 characters in length.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. The number of nodes allocated to this instance. This may be zero
        # in API responses for instances that are not yet in state `READY`.
        # See [the
        # documentation](https://cloud.google.com/spanner/docs/instances#node_count)
        # for more information about nodes.
        # Corresponds to the JSON property `nodeCount`
        # @return [Fixnum]
        attr_accessor :node_count
      
        # Output only. The current instance state. For
        # CreateInstance, the state must be
        # either omitted or set to `CREATING`. For
        # UpdateInstance, the state must be
        # either omitted or set to `READY`.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @node_count = args[:node_count] if args.key?(:node_count)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # A possible configuration for a Cloud Spanner instance. Configurations
      # define the geographic placement of nodes and their replication.
      class InstanceConfig
        include Google::Apis::Core::Hashable
      
        # The name of this instance configuration as it appears in UIs.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # A unique identifier for the instance configuration.  Values
        # are of the form
        # `projects/<project>/instanceConfigs/a-z*`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The geographic placement of nodes in this instance configuration and their
        # replication properties.
        # Corresponds to the JSON property `replicas`
        # @return [Array<Google::Apis::SpannerV1::ReplicaInfo>]
        attr_accessor :replicas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @replicas = args[:replicas] if args.key?(:replicas)
        end
      end
      
      # KeyRange represents a range of rows in a table or index.
      # A range has a start key and an end key. These keys can be open or
      # closed, indicating if the range includes rows with that key.
      # Keys are represented by lists, where the ith value in the list
      # corresponds to the ith component of the table or index primary key.
      # Individual values are encoded as described
      # here.
      # For example, consider the following table definition:
      # CREATE TABLE UserEvents (
      # UserName STRING(MAX),
      # EventDate STRING(10)
      # ) PRIMARY KEY(UserName, EventDate);
      # The following keys name rows in this table:
      # "Bob", "2014-09-23"
      # Since the `UserEvents` table's `PRIMARY KEY` clause names two
      # columns, each `UserEvents` key has two elements; the first is the
      # `UserName`, and the second is the `EventDate`.
      # Key ranges with multiple components are interpreted
      # lexicographically by component using the table or index key's declared
      # sort order. For example, the following range returns all events for
      # user `"Bob"` that occurred in the year 2015:
      # "start_closed": ["Bob", "2015-01-01"]
      # "end_closed": ["Bob", "2015-12-31"]
      # Start and end keys can omit trailing key components. This affects the
      # inclusion and exclusion of rows that exactly match the provided key
      # components: if the key is closed, then rows that exactly match the
      # provided components are included; if the key is open, then rows
      # that exactly match are not included.
      # For example, the following range includes all events for `"Bob"` that
      # occurred during and after the year 2000:
      # "start_closed": ["Bob", "2000-01-01"]
      # "end_closed": ["Bob"]
      # The next example retrieves all events for `"Bob"`:
      # "start_closed": ["Bob"]
      # "end_closed": ["Bob"]
      # To retrieve events before the year 2000:
      # "start_closed": ["Bob"]
      # "end_open": ["Bob", "2000-01-01"]
      # The following range includes all rows in the table:
      # "start_closed": []
      # "end_closed": []
      # This range returns all users whose `UserName` begins with any
      # character from A to C:
      # "start_closed": ["A"]
      # "end_open": ["D"]
      # This range returns all users whose `UserName` begins with B:
      # "start_closed": ["B"]
      # "end_open": ["C"]
      # Key ranges honor column sort order. For example, suppose a table is
      # defined as follows:
      # CREATE TABLE DescendingSortedTable `
      # Key INT64,
      # ...
      # ) PRIMARY KEY(Key DESC);
      # The following range retrieves all rows with key values between 1
      # and 100 inclusive:
      # "start_closed": ["100"]
      # "end_closed": ["1"]
      # Note that 100 is passed as the start, and 1 is passed as the end,
      # because `Key` is a descending column in the schema.
      class KeyRange
        include Google::Apis::Core::Hashable
      
        # If the end is closed, then the range includes all rows whose
        # first `len(end_closed)` key columns exactly match `end_closed`.
        # Corresponds to the JSON property `endClosed`
        # @return [Array<Object>]
        attr_accessor :end_closed
      
        # If the end is open, then the range excludes rows whose first
        # `len(end_open)` key columns exactly match `end_open`.
        # Corresponds to the JSON property `endOpen`
        # @return [Array<Object>]
        attr_accessor :end_open
      
        # If the start is closed, then the range includes all rows whose
        # first `len(start_closed)` key columns exactly match `start_closed`.
        # Corresponds to the JSON property `startClosed`
        # @return [Array<Object>]
        attr_accessor :start_closed
      
        # If the start is open, then the range excludes rows whose first
        # `len(start_open)` key columns exactly match `start_open`.
        # Corresponds to the JSON property `startOpen`
        # @return [Array<Object>]
        attr_accessor :start_open
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_closed = args[:end_closed] if args.key?(:end_closed)
          @end_open = args[:end_open] if args.key?(:end_open)
          @start_closed = args[:start_closed] if args.key?(:start_closed)
          @start_open = args[:start_open] if args.key?(:start_open)
        end
      end
      
      # `KeySet` defines a collection of Cloud Spanner keys and/or key ranges. All
      # the keys are expected to be in the same table or index. The keys need
      # not be sorted in any particular way.
      # If the same key is specified multiple times in the set (for example
      # if two ranges, two keys, or a key and a range overlap), Cloud Spanner
      # behaves as if the key were only specified once.
      class KeySet
        include Google::Apis::Core::Hashable
      
        # For convenience `all` can be set to `true` to indicate that this
        # `KeySet` matches all keys in the table or index. Note that any keys
        # specified in `keys` or `ranges` are only yielded once.
        # Corresponds to the JSON property `all`
        # @return [Boolean]
        attr_accessor :all
        alias_method :all?, :all
      
        # A list of specific keys. Entries in `keys` should have exactly as
        # many elements as there are columns in the primary or index key
        # with which this `KeySet` is used.  Individual key values are
        # encoded as described here.
        # Corresponds to the JSON property `keys`
        # @return [Array<Array<Object>>]
        attr_accessor :keys
      
        # A list of key ranges. See KeyRange for more information about
        # key range specifications.
        # Corresponds to the JSON property `ranges`
        # @return [Array<Google::Apis::SpannerV1::KeyRange>]
        attr_accessor :ranges
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all = args[:all] if args.key?(:all)
          @keys = args[:keys] if args.key?(:keys)
          @ranges = args[:ranges] if args.key?(:ranges)
        end
      end
      
      # The response for ListDatabases.
      class ListDatabasesResponse
        include Google::Apis::Core::Hashable
      
        # Databases that matched the request.
        # Corresponds to the JSON property `databases`
        # @return [Array<Google::Apis::SpannerV1::Database>]
        attr_accessor :databases
      
        # `next_page_token` can be sent in a subsequent
        # ListDatabases call to fetch more
        # of the matching databases.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @databases = args[:databases] if args.key?(:databases)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for ListInstanceConfigs.
      class ListInstanceConfigsResponse
        include Google::Apis::Core::Hashable
      
        # The list of requested instance configurations.
        # Corresponds to the JSON property `instanceConfigs`
        # @return [Array<Google::Apis::SpannerV1::InstanceConfig>]
        attr_accessor :instance_configs
      
        # `next_page_token` can be sent in a subsequent
        # ListInstanceConfigs call to
        # fetch more of the matching instance configurations.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_configs = args[:instance_configs] if args.key?(:instance_configs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for ListInstances.
      class ListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # The list of requested instances.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::SpannerV1::Instance>]
        attr_accessor :instances
      
        # `next_page_token` can be sent in a subsequent
        # ListInstances call to fetch more
        # of the matching instances.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::SpannerV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # The response for ListSessions.
      class ListSessionsResponse
        include Google::Apis::Core::Hashable
      
        # `next_page_token` can be sent in a subsequent
        # ListSessions call to fetch more of the matching
        # sessions.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of requested sessions.
        # Corresponds to the JSON property `sessions`
        # @return [Array<Google::Apis::SpannerV1::Session>]
        attr_accessor :sessions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sessions = args[:sessions] if args.key?(:sessions)
        end
      end
      
      # A modification to one or more Cloud Spanner rows.  Mutations can be
      # applied to a Cloud Spanner database by sending them in a
      # Commit call.
      class Mutation
        include Google::Apis::Core::Hashable
      
        # Arguments to delete operations.
        # Corresponds to the JSON property `delete`
        # @return [Google::Apis::SpannerV1::Delete]
        attr_accessor :delete
      
        # Arguments to insert, update, insert_or_update, and
        # replace operations.
        # Corresponds to the JSON property `insert`
        # @return [Google::Apis::SpannerV1::Write]
        attr_accessor :insert
      
        # Arguments to insert, update, insert_or_update, and
        # replace operations.
        # Corresponds to the JSON property `insertOrUpdate`
        # @return [Google::Apis::SpannerV1::Write]
        attr_accessor :insert_or_update
      
        # Arguments to insert, update, insert_or_update, and
        # replace operations.
        # Corresponds to the JSON property `replace`
        # @return [Google::Apis::SpannerV1::Write]
        attr_accessor :replace
      
        # Arguments to insert, update, insert_or_update, and
        # replace operations.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::SpannerV1::Write]
        attr_accessor :update
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delete = args[:delete] if args.key?(:delete)
          @insert = args[:insert] if args.key?(:insert)
          @insert_or_update = args[:insert_or_update] if args.key?(:insert_or_update)
          @replace = args[:replace] if args.key?(:replace)
          @update = args[:update] if args.key?(:update)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::SpannerV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # Partial results from a streaming read or SQL query. Streaming reads and
      # SQL queries better tolerate large result sets, large rows, and large
      # values, but are a little trickier to consume.
      class PartialResultSet
        include Google::Apis::Core::Hashable
      
        # If true, then the final value in values is chunked, and must
        # be combined with more values from subsequent `PartialResultSet`s
        # to obtain a complete field value.
        # Corresponds to the JSON property `chunkedValue`
        # @return [Boolean]
        attr_accessor :chunked_value
        alias_method :chunked_value?, :chunked_value
      
        # Metadata about a ResultSet or PartialResultSet.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::SpannerV1::ResultSetMetadata]
        attr_accessor :metadata
      
        # Streaming calls might be interrupted for a variety of reasons, such
        # as TCP connection loss. If this occurs, the stream of results can
        # be resumed by re-sending the original request and including
        # `resume_token`. Note that executing any other transaction in the
        # same session invalidates the token.
        # Corresponds to the JSON property `resumeToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :resume_token
      
        # Additional statistics about a ResultSet or PartialResultSet.
        # Corresponds to the JSON property `stats`
        # @return [Google::Apis::SpannerV1::ResultSetStats]
        attr_accessor :stats
      
        # A streamed result set consists of a stream of values, which might
        # be split into many `PartialResultSet` messages to accommodate
        # large rows and/or large values. Every N complete values defines a
        # row, where N is equal to the number of entries in
        # metadata.row_type.fields.
        # Most values are encoded based on type as described
        # here.
        # It is possible that the last value in values is "chunked",
        # meaning that the rest of the value is sent in subsequent
        # `PartialResultSet`(s). This is denoted by the chunked_value
        # field. Two or more chunked values can be merged to form a
        # complete value as follows:
        # * `bool/number/null`: cannot be chunked
        # * `string`: concatenate the strings
        # * `list`: concatenate the lists. If the last element in a list is a
        # `string`, `list`, or `object`, merge it with the first element in
        # the next list by applying these rules recursively.
        # * `object`: concatenate the (field name, field value) pairs. If a
        # field name is duplicated, then apply these rules recursively
        # to merge the field values.
        # Some examples of merging:
        # # Strings are concatenated.
        # "foo", "bar" => "foobar"
        # # Lists of non-strings are concatenated.
        # [2, 3], [4] => [2, 3, 4]
        # # Lists are concatenated, but the last and first elements are merged
        # # because they are strings.
        # ["a", "b"], ["c", "d"] => ["a", "bc", "d"]
        # # Lists are concatenated, but the last and first elements are merged
        # # because they are lists. Recursively, the last and first elements
        # # of the inner lists are merged because they are strings.
        # ["a", ["b", "c"]], [["d"], "e"] => ["a", ["b", "cd"], "e"]
        # # Non-overlapping object fields are combined.
        # `"a": "1"`, `"b": "2"` => `"a": "1", "b": 2"`
        # # Overlapping object fields are merged.
        # `"a": "1"`, `"a": "2"` => `"a": "12"`
        # # Examples of merging objects containing lists of strings.
        # `"a": ["1"]`, `"a": ["2"]` => `"a": ["12"]`
        # For a more complete example, suppose a streaming SQL query is
        # yielding a result set whose rows contain a single string
        # field. The following `PartialResultSet`s might be yielded:
        # `
        # "metadata": ` ... `
        # "values": ["Hello", "W"]
        # "chunked_value": true
        # "resume_token": "Af65..."
        # `
        # `
        # "values": ["orl"]
        # "chunked_value": true
        # "resume_token": "Bqp2..."
        # `
        # `
        # "values": ["d"]
        # "resume_token": "Zx1B..."
        # `
        # This sequence of `PartialResultSet`s encodes two rows, one
        # containing the field value `"Hello"`, and a second containing the
        # field value `"World" = "W" + "orl" + "d"`.
        # Corresponds to the JSON property `values`
        # @return [Array<Object>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @chunked_value = args[:chunked_value] if args.key?(:chunked_value)
          @metadata = args[:metadata] if args.key?(:metadata)
          @resume_token = args[:resume_token] if args.key?(:resume_token)
          @stats = args[:stats] if args.key?(:stats)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Information returned for each partition returned in a
      # PartitionResponse.
      class Partition
        include Google::Apis::Core::Hashable
      
        # This token can be passed to Read, StreamingRead, ExecuteSql, or
        # ExecuteStreamingSql requests to restrict the results to those identified by
        # this partition token.
        # Corresponds to the JSON property `partitionToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :partition_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @partition_token = args[:partition_token] if args.key?(:partition_token)
        end
      end
      
      # Options for a PartitionQueryRequest and
      # PartitionReadRequest.
      class PartitionOptions
        include Google::Apis::Core::Hashable
      
        # **Note:** This hint is currently ignored by PartitionQuery and
        # PartitionRead requests.
        # The desired maximum number of partitions to return.  For example, this may
        # be set to the number of workers available.  The default for this option
        # is currently 10,000. The maximum value is currently 200,000.  This is only
        # a hint.  The actual number of partitions returned may be smaller or larger
        # than this maximum count request.
        # Corresponds to the JSON property `maxPartitions`
        # @return [Fixnum]
        attr_accessor :max_partitions
      
        # **Note:** This hint is currently ignored by PartitionQuery and
        # PartitionRead requests.
        # The desired data size for each partition generated.  The default for this
        # option is currently 1 GiB.  This is only a hint. The actual size of each
        # partition may be smaller or larger than this size request.
        # Corresponds to the JSON property `partitionSizeBytes`
        # @return [Fixnum]
        attr_accessor :partition_size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_partitions = args[:max_partitions] if args.key?(:max_partitions)
          @partition_size_bytes = args[:partition_size_bytes] if args.key?(:partition_size_bytes)
        end
      end
      
      # The request for PartitionQuery
      class PartitionQueryRequest
        include Google::Apis::Core::Hashable
      
        # It is not always possible for Cloud Spanner to infer the right SQL type
        # from a JSON value.  For example, values of type `BYTES` and values
        # of type `STRING` both appear in params as JSON strings.
        # In these cases, `param_types` can be used to specify the exact
        # SQL type for some or all of the SQL query parameters. See the
        # definition of Type for more information
        # about SQL types.
        # Corresponds to the JSON property `paramTypes`
        # @return [Hash<String,Google::Apis::SpannerV1::Type>]
        attr_accessor :param_types
      
        # Parameter names and values that bind to placeholders in the SQL string.
        # A parameter placeholder consists of the `@` character followed by the
        # parameter name (for example, `@firstName`). Parameter names can contain
        # letters, numbers, and underscores.
        # Parameters can appear anywhere that a literal value is expected.  The same
        # parameter name can be used more than once, for example:
        # `"WHERE id > @msg_id AND id < @msg_id + 100"`
        # It is an error to execute a SQL statement with unbound parameters.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # Options for a PartitionQueryRequest and
        # PartitionReadRequest.
        # Corresponds to the JSON property `partitionOptions`
        # @return [Google::Apis::SpannerV1::PartitionOptions]
        attr_accessor :partition_options
      
        # The query request to generate partitions for. The request will fail if
        # the query is not root partitionable. The query plan of a root
        # partitionable query has a single distributed union operator. A distributed
        # union operator conceptually divides one or more tables into multiple
        # splits, remotely evaluates a subquery independently on each split, and
        # then unions all results.
        # This must not contain DML commands, such as INSERT, UPDATE, or
        # DELETE. Use ExecuteStreamingSql with a
        # PartitionedDml transaction for large, partition-friendly DML operations.
        # Corresponds to the JSON property `sql`
        # @return [String]
        attr_accessor :sql
      
        # This message is used to select the transaction in which a
        # Read or
        # ExecuteSql call runs.
        # See TransactionOptions for more information about transactions.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::TransactionSelector]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @param_types = args[:param_types] if args.key?(:param_types)
          @params = args[:params] if args.key?(:params)
          @partition_options = args[:partition_options] if args.key?(:partition_options)
          @sql = args[:sql] if args.key?(:sql)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The request for PartitionRead
      class PartitionReadRequest
        include Google::Apis::Core::Hashable
      
        # The columns of table to be returned for each row matching
        # this request.
        # Corresponds to the JSON property `columns`
        # @return [Array<String>]
        attr_accessor :columns
      
        # If non-empty, the name of an index on table. This index is
        # used instead of the table primary key when interpreting key_set
        # and sorting result rows. See key_set for further information.
        # Corresponds to the JSON property `index`
        # @return [String]
        attr_accessor :index
      
        # `KeySet` defines a collection of Cloud Spanner keys and/or key ranges. All
        # the keys are expected to be in the same table or index. The keys need
        # not be sorted in any particular way.
        # If the same key is specified multiple times in the set (for example
        # if two ranges, two keys, or a key and a range overlap), Cloud Spanner
        # behaves as if the key were only specified once.
        # Corresponds to the JSON property `keySet`
        # @return [Google::Apis::SpannerV1::KeySet]
        attr_accessor :key_set
      
        # Options for a PartitionQueryRequest and
        # PartitionReadRequest.
        # Corresponds to the JSON property `partitionOptions`
        # @return [Google::Apis::SpannerV1::PartitionOptions]
        attr_accessor :partition_options
      
        # Required. The name of the table in the database to be read.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        # This message is used to select the transaction in which a
        # Read or
        # ExecuteSql call runs.
        # See TransactionOptions for more information about transactions.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::TransactionSelector]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @index = args[:index] if args.key?(:index)
          @key_set = args[:key_set] if args.key?(:key_set)
          @partition_options = args[:partition_options] if args.key?(:partition_options)
          @table = args[:table] if args.key?(:table)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The response for PartitionQuery
      # or PartitionRead
      class PartitionResponse
        include Google::Apis::Core::Hashable
      
        # Partitions created by this request.
        # Corresponds to the JSON property `partitions`
        # @return [Array<Google::Apis::SpannerV1::Partition>]
        attr_accessor :partitions
      
        # A transaction.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::Transaction]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @partitions = args[:partitions] if args.key?(:partitions)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # Message type to initiate a Partitioned DML transaction.
      class PartitionedDml
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Node information for nodes appearing in a QueryPlan.plan_nodes.
      class PlanNode
        include Google::Apis::Core::Hashable
      
        # List of child node `index`es and their relationship to this parent.
        # Corresponds to the JSON property `childLinks`
        # @return [Array<Google::Apis::SpannerV1::ChildLink>]
        attr_accessor :child_links
      
        # The display name for the node.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The execution statistics associated with the node, contained in a group of
        # key-value pairs. Only present if the plan was returned as a result of a
        # profile query. For example, number of executions, number of rows/time per
        # execution etc.
        # Corresponds to the JSON property `executionStats`
        # @return [Hash<String,Object>]
        attr_accessor :execution_stats
      
        # The `PlanNode`'s index in node list.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Used to determine the type of node. May be needed for visualizing
        # different kinds of nodes differently. For example, If the node is a
        # SCALAR node, it will have a condensed representation
        # which can be used to directly embed a description of the node in its
        # parent.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Attributes relevant to the node contained in a group of key-value pairs.
        # For example, a Parameter Reference node could have the following
        # information in its metadata:
        # `
        # "parameter_reference": "param1",
        # "parameter_type": "array"
        # `
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Condensed representation of a node and its subtree. Only present for
        # `SCALAR` PlanNode(s).
        # Corresponds to the JSON property `shortRepresentation`
        # @return [Google::Apis::SpannerV1::ShortRepresentation]
        attr_accessor :short_representation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @child_links = args[:child_links] if args.key?(:child_links)
          @display_name = args[:display_name] if args.key?(:display_name)
          @execution_stats = args[:execution_stats] if args.key?(:execution_stats)
          @index = args[:index] if args.key?(:index)
          @kind = args[:kind] if args.key?(:kind)
          @metadata = args[:metadata] if args.key?(:metadata)
          @short_representation = args[:short_representation] if args.key?(:short_representation)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` consists of a list of `bindings`. A `binding` binds a list of
      # `members` to a `role`, where the members can be user accounts, Google groups,
      # Google domains, and service accounts. A `role` is a named list of permissions
      # defined by IAM.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/owner",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-other-app@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/viewer",
      # "members": ["user:sean@example.com"]
      # `
      # ]
      # `
      # **YAML Example**
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-other-app@appspot.gserviceaccount.com
      # role: roles/owner
      # - members:
      # - user:sean@example.com
      # role: roles/viewer
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Associates a list of `members` to a `role`.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::SpannerV1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Deprecated.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Contains an ordered list of nodes appearing in the query plan.
      class QueryPlan
        include Google::Apis::Core::Hashable
      
        # The nodes in the query plan. Plan nodes are returned in pre-order starting
        # with the plan root. Each PlanNode's `id` corresponds to its index in
        # `plan_nodes`.
        # Corresponds to the JSON property `planNodes`
        # @return [Array<Google::Apis::SpannerV1::PlanNode>]
        attr_accessor :plan_nodes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @plan_nodes = args[:plan_nodes] if args.key?(:plan_nodes)
        end
      end
      
      # Message type to initiate a read-only transaction.
      class ReadOnly
        include Google::Apis::Core::Hashable
      
        # Executes all reads at a timestamp that is `exact_staleness`
        # old. The timestamp is chosen soon after the read is started.
        # Guarantees that all writes that have committed more than the
        # specified number of seconds ago are visible. Because Cloud Spanner
        # chooses the exact timestamp, this mode works even if the client's
        # local clock is substantially skewed from Cloud Spanner commit
        # timestamps.
        # Useful for reading at nearby replicas without the distributed
        # timestamp negotiation overhead of `max_staleness`.
        # Corresponds to the JSON property `exactStaleness`
        # @return [String]
        attr_accessor :exact_staleness
      
        # Read data at a timestamp >= `NOW - max_staleness`
        # seconds. Guarantees that all writes that have committed more
        # than the specified number of seconds ago are visible. Because
        # Cloud Spanner chooses the exact timestamp, this mode works even if
        # the client's local clock is substantially skewed from Cloud Spanner
        # commit timestamps.
        # Useful for reading the freshest data available at a nearby
        # replica, while bounding the possible staleness if the local
        # replica has fallen behind.
        # Note that this option can only be used in single-use
        # transactions.
        # Corresponds to the JSON property `maxStaleness`
        # @return [String]
        attr_accessor :max_staleness
      
        # Executes all reads at a timestamp >= `min_read_timestamp`.
        # This is useful for requesting fresher data than some previous
        # read, or data that is fresh enough to observe the effects of some
        # previously committed transaction whose timestamp is known.
        # Note that this option can only be used in single-use transactions.
        # A timestamp in RFC3339 UTC \"Zulu\" format, accurate to nanoseconds.
        # Example: `"2014-10-02T15:01:23.045123456Z"`.
        # Corresponds to the JSON property `minReadTimestamp`
        # @return [String]
        attr_accessor :min_read_timestamp
      
        # Executes all reads at the given timestamp. Unlike other modes,
        # reads at a specific timestamp are repeatable; the same read at
        # the same timestamp always returns the same data. If the
        # timestamp is in the future, the read will block until the
        # specified timestamp, modulo the read's deadline.
        # Useful for large scale consistent reads such as mapreduces, or
        # for coordinating many reads against a consistent snapshot of the
        # data.
        # A timestamp in RFC3339 UTC \"Zulu\" format, accurate to nanoseconds.
        # Example: `"2014-10-02T15:01:23.045123456Z"`.
        # Corresponds to the JSON property `readTimestamp`
        # @return [String]
        attr_accessor :read_timestamp
      
        # If true, the Cloud Spanner-selected read timestamp is included in
        # the Transaction message that describes the transaction.
        # Corresponds to the JSON property `returnReadTimestamp`
        # @return [Boolean]
        attr_accessor :return_read_timestamp
        alias_method :return_read_timestamp?, :return_read_timestamp
      
        # Read at a timestamp where all previously committed transactions
        # are visible.
        # Corresponds to the JSON property `strong`
        # @return [Boolean]
        attr_accessor :strong
        alias_method :strong?, :strong
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exact_staleness = args[:exact_staleness] if args.key?(:exact_staleness)
          @max_staleness = args[:max_staleness] if args.key?(:max_staleness)
          @min_read_timestamp = args[:min_read_timestamp] if args.key?(:min_read_timestamp)
          @read_timestamp = args[:read_timestamp] if args.key?(:read_timestamp)
          @return_read_timestamp = args[:return_read_timestamp] if args.key?(:return_read_timestamp)
          @strong = args[:strong] if args.key?(:strong)
        end
      end
      
      # The request for Read and
      # StreamingRead.
      class ReadRequest
        include Google::Apis::Core::Hashable
      
        # The columns of table to be returned for each row matching
        # this request.
        # Corresponds to the JSON property `columns`
        # @return [Array<String>]
        attr_accessor :columns
      
        # If non-empty, the name of an index on table. This index is
        # used instead of the table primary key when interpreting key_set
        # and sorting result rows. See key_set for further information.
        # Corresponds to the JSON property `index`
        # @return [String]
        attr_accessor :index
      
        # `KeySet` defines a collection of Cloud Spanner keys and/or key ranges. All
        # the keys are expected to be in the same table or index. The keys need
        # not be sorted in any particular way.
        # If the same key is specified multiple times in the set (for example
        # if two ranges, two keys, or a key and a range overlap), Cloud Spanner
        # behaves as if the key were only specified once.
        # Corresponds to the JSON property `keySet`
        # @return [Google::Apis::SpannerV1::KeySet]
        attr_accessor :key_set
      
        # If greater than zero, only the first `limit` rows are yielded. If `limit`
        # is zero, the default is no limit. A limit cannot be specified if
        # `partition_token` is set.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # If present, results will be restricted to the specified partition
        # previously created using PartitionRead().    There must be an exact
        # match for the values of fields common to this message and the
        # PartitionReadRequest message used to create this partition_token.
        # Corresponds to the JSON property `partitionToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :partition_token
      
        # If this request is resuming a previously interrupted read,
        # `resume_token` should be copied from the last
        # PartialResultSet yielded before the interruption. Doing this
        # enables the new read to resume where the last read left off. The
        # rest of the request parameters must exactly match the request
        # that yielded this token.
        # Corresponds to the JSON property `resumeToken`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :resume_token
      
        # Required. The name of the table in the database to be read.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        # This message is used to select the transaction in which a
        # Read or
        # ExecuteSql call runs.
        # See TransactionOptions for more information about transactions.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::TransactionSelector]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @index = args[:index] if args.key?(:index)
          @key_set = args[:key_set] if args.key?(:key_set)
          @limit = args[:limit] if args.key?(:limit)
          @partition_token = args[:partition_token] if args.key?(:partition_token)
          @resume_token = args[:resume_token] if args.key?(:resume_token)
          @table = args[:table] if args.key?(:table)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # Message type to initiate a read-write transaction. Currently this
      # transaction type has no options.
      class ReadWrite
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # 
      class ReplicaInfo
        include Google::Apis::Core::Hashable
      
        # If true, this location is designated as the default leader location where
        # leader replicas are placed. See the [region types
        # documentation](https://cloud.google.com/spanner/docs/instances#region_types)
        # for more details.
        # Corresponds to the JSON property `defaultLeaderLocation`
        # @return [Boolean]
        attr_accessor :default_leader_location
        alias_method :default_leader_location?, :default_leader_location
      
        # The location of the serving resources, e.g. "us-central1".
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # The type of replica.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_leader_location = args[:default_leader_location] if args.key?(:default_leader_location)
          @location = args[:location] if args.key?(:location)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Results from Read or
      # ExecuteSql.
      class ResultSet
        include Google::Apis::Core::Hashable
      
        # Metadata about a ResultSet or PartialResultSet.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::SpannerV1::ResultSetMetadata]
        attr_accessor :metadata
      
        # Each element in `rows` is a row whose format is defined by
        # metadata.row_type. The ith element
        # in each row matches the ith field in
        # metadata.row_type. Elements are
        # encoded based on type as described
        # here.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<Object>>]
        attr_accessor :rows
      
        # Additional statistics about a ResultSet or PartialResultSet.
        # Corresponds to the JSON property `stats`
        # @return [Google::Apis::SpannerV1::ResultSetStats]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metadata = args[:metadata] if args.key?(:metadata)
          @rows = args[:rows] if args.key?(:rows)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # Metadata about a ResultSet or PartialResultSet.
      class ResultSetMetadata
        include Google::Apis::Core::Hashable
      
        # `StructType` defines the fields of a STRUCT type.
        # Corresponds to the JSON property `rowType`
        # @return [Google::Apis::SpannerV1::StructType]
        attr_accessor :row_type
      
        # A transaction.
        # Corresponds to the JSON property `transaction`
        # @return [Google::Apis::SpannerV1::Transaction]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @row_type = args[:row_type] if args.key?(:row_type)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # Additional statistics about a ResultSet or PartialResultSet.
      class ResultSetStats
        include Google::Apis::Core::Hashable
      
        # Contains an ordered list of nodes appearing in the query plan.
        # Corresponds to the JSON property `queryPlan`
        # @return [Google::Apis::SpannerV1::QueryPlan]
        attr_accessor :query_plan
      
        # Aggregated statistics from the execution of the query. Only present when
        # the query is profiled. For example, a query could return the statistics as
        # follows:
        # `
        # "rows_returned": "3",
        # "elapsed_time": "1.22 secs",
        # "cpu_time": "1.19 secs"
        # `
        # Corresponds to the JSON property `queryStats`
        # @return [Hash<String,Object>]
        attr_accessor :query_stats
      
        # Standard DML returns an exact count of rows that were modified.
        # Corresponds to the JSON property `rowCountExact`
        # @return [Fixnum]
        attr_accessor :row_count_exact
      
        # Partitioned DML does not offer exactly-once semantics, so it
        # returns a lower bound of the rows modified.
        # Corresponds to the JSON property `rowCountLowerBound`
        # @return [Fixnum]
        attr_accessor :row_count_lower_bound
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_plan = args[:query_plan] if args.key?(:query_plan)
          @query_stats = args[:query_stats] if args.key?(:query_stats)
          @row_count_exact = args[:row_count_exact] if args.key?(:row_count_exact)
          @row_count_lower_bound = args[:row_count_lower_bound] if args.key?(:row_count_lower_bound)
        end
      end
      
      # The request for Rollback.
      class RollbackRequest
        include Google::Apis::Core::Hashable
      
        # Required. The transaction to roll back.
        # Corresponds to the JSON property `transactionId`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction_id = args[:transaction_id] if args.key?(:transaction_id)
        end
      end
      
      # A session in the Cloud Spanner API.
      class Session
        include Google::Apis::Core::Hashable
      
        # Output only. The approximate timestamp when the session is last used. It is
        # typically earlier than the actual last use time.
        # Corresponds to the JSON property `approximateLastUseTime`
        # @return [String]
        attr_accessor :approximate_last_use_time
      
        # Output only. The timestamp when the session is created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The labels for the session.
        # * Label keys must be between 1 and 63 characters long and must conform to
        # the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`.
        # * Label values must be between 0 and 63 characters long and must conform
        # to the regular expression `([a-z]([-a-z0-9]*[a-z0-9])?)?`.
        # * No more than 64 labels can be associated with a given session.
        # See https://goo.gl/xmQnxf for more information on and examples of labels.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The name of the session. This is always system-assigned; values provided
        # when creating a session are ignored.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @approximate_last_use_time = args[:approximate_last_use_time] if args.key?(:approximate_last_use_time)
          @create_time = args[:create_time] if args.key?(:create_time)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` consists of a list of `bindings`. A `binding` binds a list of
        # `members` to a `role`, where the members can be user accounts, Google groups,
        # Google domains, and service accounts. A `role` is a named list of permissions
        # defined by IAM.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/owner",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-other-app@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/viewer",
        # "members": ["user:sean@example.com"]
        # `
        # ]
        # `
        # **YAML Example**
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-other-app@appspot.gserviceaccount.com
        # role: roles/owner
        # - members:
        # - user:sean@example.com
        # role: roles/viewer
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::SpannerV1::Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # Condensed representation of a node and its subtree. Only present for
      # `SCALAR` PlanNode(s).
      class ShortRepresentation
        include Google::Apis::Core::Hashable
      
        # A string representation of the expression subtree rooted at this node.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A mapping of (subquery variable name) -> (subquery node id) for cases
        # where the `description` string of this node references a `SCALAR`
        # subquery contained in the expression subtree rooted at this node. The
        # referenced `SCALAR` subquery may not necessarily be a direct child of
        # this node.
        # Corresponds to the JSON property `subqueries`
        # @return [Hash<String,Fixnum>]
        attr_accessor :subqueries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @subqueries = args[:subqueries] if args.key?(:subqueries)
        end
      end
      
      # A single DML statement.
      class Statement
        include Google::Apis::Core::Hashable
      
        # It is not always possible for Cloud Spanner to infer the right SQL type
        # from a JSON value.  For example, values of type `BYTES` and values
        # of type `STRING` both appear in params as JSON strings.
        # In these cases, `param_types` can be used to specify the exact
        # SQL type for some or all of the SQL statement parameters. See the
        # definition of Type for more information
        # about SQL types.
        # Corresponds to the JSON property `paramTypes`
        # @return [Hash<String,Google::Apis::SpannerV1::Type>]
        attr_accessor :param_types
      
        # Parameter names and values that bind to placeholders in the DML string.
        # A parameter placeholder consists of the `@` character followed by the
        # parameter name (for example, `@firstName`). Parameter names can contain
        # letters, numbers, and underscores.
        # Parameters can appear anywhere that a literal value is expected.  The
        # same parameter name can be used more than once, for example:
        # `"WHERE id > @msg_id AND id < @msg_id + 100"`
        # It is an error to execute a SQL statement with unbound parameters.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,Object>]
        attr_accessor :params
      
        # Required. The DML string.
        # Corresponds to the JSON property `sql`
        # @return [String]
        attr_accessor :sql
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @param_types = args[:param_types] if args.key?(:param_types)
          @params = args[:params] if args.key?(:params)
          @sql = args[:sql] if args.key?(:sql)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # `StructType` defines the fields of a STRUCT type.
      class StructType
        include Google::Apis::Core::Hashable
      
        # The list of fields that make up this struct. Order is
        # significant, because values of this struct type are represented as
        # lists, where the order of field values matches the order of
        # fields in the StructType. In turn, the order of fields
        # matches the order of columns in a read request, or the order of
        # fields in the `SELECT` clause of a query.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::SpannerV1::Field>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # REQUIRED: The set of permissions to check for 'resource'.
        # Permissions with wildcards (such as '*', 'spanner.*', 'spanner.instances.*')
        # are not allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # A transaction.
      class Transaction
        include Google::Apis::Core::Hashable
      
        # `id` may be used to identify the transaction in subsequent
        # Read,
        # ExecuteSql,
        # Commit, or
        # Rollback calls.
        # Single-use read-only transactions do not have IDs, because
        # single-use transactions do not support multiple requests.
        # Corresponds to the JSON property `id`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :id
      
        # For snapshot read-only transactions, the read timestamp chosen
        # for the transaction. Not returned by default: see
        # TransactionOptions.ReadOnly.return_read_timestamp.
        # A timestamp in RFC3339 UTC \"Zulu\" format, accurate to nanoseconds.
        # Example: `"2014-10-02T15:01:23.045123456Z"`.
        # Corresponds to the JSON property `readTimestamp`
        # @return [String]
        attr_accessor :read_timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @read_timestamp = args[:read_timestamp] if args.key?(:read_timestamp)
        end
      end
      
      # # Transactions
      # Each session can have at most one active transaction at a time. After the
      # active transaction is completed, the session can immediately be
      # re-used for the next transaction. It is not necessary to create a
      # new session for each transaction.
      # # Transaction Modes
      # Cloud Spanner supports three transaction modes:
      # 1. Locking read-write. This type of transaction is the only way
      # to write data into Cloud Spanner. These transactions rely on
      # pessimistic locking and, if necessary, two-phase commit.
      # Locking read-write transactions may abort, requiring the
      # application to retry.
      # 2. Snapshot read-only. This transaction type provides guaranteed
      # consistency across several reads, but does not allow
      # writes. Snapshot read-only transactions can be configured to
      # read at timestamps in the past. Snapshot read-only
      # transactions do not need to be committed.
      # 3. Partitioned DML. This type of transaction is used to execute
      # a single Partitioned DML statement. Partitioned DML partitions
      # the key space and runs the DML statement over each partition
      # in parallel using separate, internal transactions that commit
      # independently. Partitioned DML transactions do not need to be
      # committed.
      # For transactions that only read, snapshot read-only transactions
      # provide simpler semantics and are almost always faster. In
      # particular, read-only transactions do not take locks, so they do
      # not conflict with read-write transactions. As a consequence of not
      # taking locks, they also do not abort, so retry loops are not needed.
      # Transactions may only read/write data in a single database. They
      # may, however, read/write data in different tables within that
      # database.
      # ## Locking Read-Write Transactions
      # Locking transactions may be used to atomically read-modify-write
      # data anywhere in a database. This type of transaction is externally
      # consistent.
      # Clients should attempt to minimize the amount of time a transaction
      # is active. Faster transactions commit with higher probability
      # and cause less contention. Cloud Spanner attempts to keep read locks
      # active as long as the transaction continues to do reads, and the
      # transaction has not been terminated by
      # Commit or
      # Rollback.  Long periods of
      # inactivity at the client may cause Cloud Spanner to release a
      # transaction's locks and abort it.
      # Conceptually, a read-write transaction consists of zero or more
      # reads or SQL statements followed by
      # Commit. At any time before
      # Commit, the client can send a
      # Rollback request to abort the
      # transaction.
      # ### Semantics
      # Cloud Spanner can commit the transaction if all read locks it acquired
      # are still valid at commit time, and it is able to acquire write
      # locks for all writes. Cloud Spanner can abort the transaction for any
      # reason. If a commit attempt returns `ABORTED`, Cloud Spanner guarantees
      # that the transaction has not modified any user data in Cloud Spanner.
      # Unless the transaction commits, Cloud Spanner makes no guarantees about
      # how long the transaction's locks were held for. It is an error to
      # use Cloud Spanner locks for any sort of mutual exclusion other than
      # between Cloud Spanner transactions themselves.
      # ### Retrying Aborted Transactions
      # When a transaction aborts, the application can choose to retry the
      # whole transaction again. To maximize the chances of successfully
      # committing the retry, the client should execute the retry in the
      # same session as the original attempt. The original session's lock
      # priority increases with each consecutive abort, meaning that each
      # attempt has a slightly better chance of success than the previous.
      # Under some circumstances (e.g., many transactions attempting to
      # modify the same row(s)), a transaction can abort many times in a
      # short period before successfully committing. Thus, it is not a good
      # idea to cap the number of retries a transaction can attempt;
      # instead, it is better to limit the total amount of wall time spent
      # retrying.
      # ### Idle Transactions
      # A transaction is considered idle if it has no outstanding reads or
      # SQL queries and has not started a read or SQL query within the last 10
      # seconds. Idle transactions can be aborted by Cloud Spanner so that they
      # don't hold on to locks indefinitely. In that case, the commit will
      # fail with error `ABORTED`.
      # If this behavior is undesirable, periodically executing a simple
      # SQL query in the transaction (e.g., `SELECT 1`) prevents the
      # transaction from becoming idle.
      # ## Snapshot Read-Only Transactions
      # Snapshot read-only transactions provides a simpler method than
      # locking read-write transactions for doing several consistent
      # reads. However, this type of transaction does not support writes.
      # Snapshot transactions do not take locks. Instead, they work by
      # choosing a Cloud Spanner timestamp, then executing all reads at that
      # timestamp. Since they do not acquire locks, they do not block
      # concurrent read-write transactions.
      # Unlike locking read-write transactions, snapshot read-only
      # transactions never abort. They can fail if the chosen read
      # timestamp is garbage collected; however, the default garbage
      # collection policy is generous enough that most applications do not
      # need to worry about this in practice.
      # Snapshot read-only transactions do not need to call
      # Commit or
      # Rollback (and in fact are not
      # permitted to do so).
      # To execute a snapshot transaction, the client specifies a timestamp
      # bound, which tells Cloud Spanner how to choose a read timestamp.
      # The types of timestamp bound are:
      # - Strong (the default).
      # - Bounded staleness.
      # - Exact staleness.
      # If the Cloud Spanner database to be read is geographically distributed,
      # stale read-only transactions can execute more quickly than strong
      # or read-write transaction, because they are able to execute far
      # from the leader replica.
      # Each type of timestamp bound is discussed in detail below.
      # ### Strong
      # Strong reads are guaranteed to see the effects of all transactions
      # that have committed before the start of the read. Furthermore, all
      # rows yielded by a single read are consistent with each other -- if
      # any part of the read observes a transaction, all parts of the read
      # see the transaction.
      # Strong reads are not repeatable: two consecutive strong read-only
      # transactions might return inconsistent results if there are
      # concurrent writes. If consistency across reads is required, the
      # reads should be executed within a transaction or at an exact read
      # timestamp.
      # See TransactionOptions.ReadOnly.strong.
      # ### Exact Staleness
      # These timestamp bounds execute reads at a user-specified
      # timestamp. Reads at a timestamp are guaranteed to see a consistent
      # prefix of the global transaction history: they observe
      # modifications done by all transactions with a commit timestamp <=
      # the read timestamp, and observe none of the modifications done by
      # transactions with a larger commit timestamp. They will block until
      # all conflicting transactions that may be assigned commit timestamps
      # <= the read timestamp have finished.
      # The timestamp can either be expressed as an absolute Cloud Spanner commit
      # timestamp or a staleness relative to the current time.
      # These modes do not require a "negotiation phase" to pick a
      # timestamp. As a result, they execute slightly faster than the
      # equivalent boundedly stale concurrency modes. On the other hand,
      # boundedly stale reads usually return fresher results.
      # See TransactionOptions.ReadOnly.read_timestamp and
      # TransactionOptions.ReadOnly.exact_staleness.
      # ### Bounded Staleness
      # Bounded staleness modes allow Cloud Spanner to pick the read timestamp,
      # subject to a user-provided staleness bound. Cloud Spanner chooses the
      # newest timestamp within the staleness bound that allows execution
      # of the reads at the closest available replica without blocking.
      # All rows yielded are consistent with each other -- if any part of
      # the read observes a transaction, all parts of the read see the
      # transaction. Boundedly stale reads are not repeatable: two stale
      # reads, even if they use the same staleness bound, can execute at
      # different timestamps and thus return inconsistent results.
      # Boundedly stale reads execute in two phases: the first phase
      # negotiates a timestamp among all replicas needed to serve the
      # read. In the second phase, reads are executed at the negotiated
      # timestamp.
      # As a result of the two phase execution, bounded staleness reads are
      # usually a little slower than comparable exact staleness
      # reads. However, they are typically able to return fresher
      # results, and are more likely to execute at the closest replica.
      # Because the timestamp negotiation requires up-front knowledge of
      # which rows will be read, it can only be used with single-use
      # read-only transactions.
      # See TransactionOptions.ReadOnly.max_staleness and
      # TransactionOptions.ReadOnly.min_read_timestamp.
      # ### Old Read Timestamps and Garbage Collection
      # Cloud Spanner continuously garbage collects deleted and overwritten data
      # in the background to reclaim storage space. This process is known
      # as "version GC". By default, version GC reclaims versions after they
      # are one hour old. Because of this, Cloud Spanner cannot perform reads
      # at read timestamps more than one hour in the past. This
      # restriction also applies to in-progress reads and/or SQL queries whose
      # timestamp become too old while executing. Reads and SQL queries with
      # too-old read timestamps fail with the error `FAILED_PRECONDITION`.
      # ## Partitioned DML Transactions
      # Partitioned DML transactions are used to execute DML statements with a
      # different execution strategy that provides different, and often better,
      # scalability properties for large, table-wide operations than DML in a
      # ReadWrite transaction. Smaller scoped statements, such as an OLTP workload,
      # should prefer using ReadWrite transactions.
      # Partitioned DML partitions the keyspace and runs the DML statement on each
      # partition in separate, internal transactions. These transactions commit
      # automatically when complete, and run independently from one another.
      # To reduce lock contention, this execution strategy only acquires read locks
      # on rows that match the WHERE clause of the statement. Additionally, the
      # smaller per-partition transactions hold locks for less time.
      # That said, Partitioned DML is not a drop-in replacement for standard DML used
      # in ReadWrite transactions.
      # - The DML statement must be fully-partitionable. Specifically, the statement
      # must be expressible as the union of many statements which each access only
      # a single row of the table.
      # - The statement is not applied atomically to all rows of the table. Rather,
      # the statement is applied atomically to partitions of the table, in
      # independent transactions. Secondary index rows are updated atomically
      # with the base table rows.
      # - Partitioned DML does not guarantee exactly-once execution semantics
      # against a partition. The statement will be applied at least once to each
      # partition. It is strongly recommended that the DML statement should be
      # idempotent to avoid unexpected results. For instance, it is potentially
      # dangerous to run a statement such as
      # `UPDATE table SET column = column + 1` as it could be run multiple times
      # against some rows.
      # - The partitions are committed automatically - there is no support for
      # Commit or Rollback. If the call returns an error, or if the client issuing
      # the ExecuteSql call dies, it is possible that some rows had the statement
      # executed on them successfully. It is also possible that statement was
      # never executed against other rows.
      # - Partitioned DML transactions may only contain the execution of a single
      # DML statement via ExecuteSql or ExecuteStreamingSql.
      # - If any error is encountered during the execution of the partitioned DML
      # operation (for instance, a UNIQUE INDEX violation, division by zero, or a
      # value that cannot be stored due to schema constraints), then the
      # operation is stopped at that point and an error is returned. It is
      # possible that at this point, some partitions have been committed (or even
      # committed multiple times), and other partitions have not been run at all.
      # Given the above, Partitioned DML is good fit for large, database-wide,
      # operations that are idempotent, such as deleting old rows from a very large
      # table.
      class TransactionOptions
        include Google::Apis::Core::Hashable
      
        # Message type to initiate a Partitioned DML transaction.
        # Corresponds to the JSON property `partitionedDml`
        # @return [Google::Apis::SpannerV1::PartitionedDml]
        attr_accessor :partitioned_dml
      
        # Message type to initiate a read-only transaction.
        # Corresponds to the JSON property `readOnly`
        # @return [Google::Apis::SpannerV1::ReadOnly]
        attr_accessor :read_only
      
        # Message type to initiate a read-write transaction. Currently this
        # transaction type has no options.
        # Corresponds to the JSON property `readWrite`
        # @return [Google::Apis::SpannerV1::ReadWrite]
        attr_accessor :read_write
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @partitioned_dml = args[:partitioned_dml] if args.key?(:partitioned_dml)
          @read_only = args[:read_only] if args.key?(:read_only)
          @read_write = args[:read_write] if args.key?(:read_write)
        end
      end
      
      # This message is used to select the transaction in which a
      # Read or
      # ExecuteSql call runs.
      # See TransactionOptions for more information about transactions.
      class TransactionSelector
        include Google::Apis::Core::Hashable
      
        # # Transactions
        # Each session can have at most one active transaction at a time. After the
        # active transaction is completed, the session can immediately be
        # re-used for the next transaction. It is not necessary to create a
        # new session for each transaction.
        # # Transaction Modes
        # Cloud Spanner supports three transaction modes:
        # 1. Locking read-write. This type of transaction is the only way
        # to write data into Cloud Spanner. These transactions rely on
        # pessimistic locking and, if necessary, two-phase commit.
        # Locking read-write transactions may abort, requiring the
        # application to retry.
        # 2. Snapshot read-only. This transaction type provides guaranteed
        # consistency across several reads, but does not allow
        # writes. Snapshot read-only transactions can be configured to
        # read at timestamps in the past. Snapshot read-only
        # transactions do not need to be committed.
        # 3. Partitioned DML. This type of transaction is used to execute
        # a single Partitioned DML statement. Partitioned DML partitions
        # the key space and runs the DML statement over each partition
        # in parallel using separate, internal transactions that commit
        # independently. Partitioned DML transactions do not need to be
        # committed.
        # For transactions that only read, snapshot read-only transactions
        # provide simpler semantics and are almost always faster. In
        # particular, read-only transactions do not take locks, so they do
        # not conflict with read-write transactions. As a consequence of not
        # taking locks, they also do not abort, so retry loops are not needed.
        # Transactions may only read/write data in a single database. They
        # may, however, read/write data in different tables within that
        # database.
        # ## Locking Read-Write Transactions
        # Locking transactions may be used to atomically read-modify-write
        # data anywhere in a database. This type of transaction is externally
        # consistent.
        # Clients should attempt to minimize the amount of time a transaction
        # is active. Faster transactions commit with higher probability
        # and cause less contention. Cloud Spanner attempts to keep read locks
        # active as long as the transaction continues to do reads, and the
        # transaction has not been terminated by
        # Commit or
        # Rollback.  Long periods of
        # inactivity at the client may cause Cloud Spanner to release a
        # transaction's locks and abort it.
        # Conceptually, a read-write transaction consists of zero or more
        # reads or SQL statements followed by
        # Commit. At any time before
        # Commit, the client can send a
        # Rollback request to abort the
        # transaction.
        # ### Semantics
        # Cloud Spanner can commit the transaction if all read locks it acquired
        # are still valid at commit time, and it is able to acquire write
        # locks for all writes. Cloud Spanner can abort the transaction for any
        # reason. If a commit attempt returns `ABORTED`, Cloud Spanner guarantees
        # that the transaction has not modified any user data in Cloud Spanner.
        # Unless the transaction commits, Cloud Spanner makes no guarantees about
        # how long the transaction's locks were held for. It is an error to
        # use Cloud Spanner locks for any sort of mutual exclusion other than
        # between Cloud Spanner transactions themselves.
        # ### Retrying Aborted Transactions
        # When a transaction aborts, the application can choose to retry the
        # whole transaction again. To maximize the chances of successfully
        # committing the retry, the client should execute the retry in the
        # same session as the original attempt. The original session's lock
        # priority increases with each consecutive abort, meaning that each
        # attempt has a slightly better chance of success than the previous.
        # Under some circumstances (e.g., many transactions attempting to
        # modify the same row(s)), a transaction can abort many times in a
        # short period before successfully committing. Thus, it is not a good
        # idea to cap the number of retries a transaction can attempt;
        # instead, it is better to limit the total amount of wall time spent
        # retrying.
        # ### Idle Transactions
        # A transaction is considered idle if it has no outstanding reads or
        # SQL queries and has not started a read or SQL query within the last 10
        # seconds. Idle transactions can be aborted by Cloud Spanner so that they
        # don't hold on to locks indefinitely. In that case, the commit will
        # fail with error `ABORTED`.
        # If this behavior is undesirable, periodically executing a simple
        # SQL query in the transaction (e.g., `SELECT 1`) prevents the
        # transaction from becoming idle.
        # ## Snapshot Read-Only Transactions
        # Snapshot read-only transactions provides a simpler method than
        # locking read-write transactions for doing several consistent
        # reads. However, this type of transaction does not support writes.
        # Snapshot transactions do not take locks. Instead, they work by
        # choosing a Cloud Spanner timestamp, then executing all reads at that
        # timestamp. Since they do not acquire locks, they do not block
        # concurrent read-write transactions.
        # Unlike locking read-write transactions, snapshot read-only
        # transactions never abort. They can fail if the chosen read
        # timestamp is garbage collected; however, the default garbage
        # collection policy is generous enough that most applications do not
        # need to worry about this in practice.
        # Snapshot read-only transactions do not need to call
        # Commit or
        # Rollback (and in fact are not
        # permitted to do so).
        # To execute a snapshot transaction, the client specifies a timestamp
        # bound, which tells Cloud Spanner how to choose a read timestamp.
        # The types of timestamp bound are:
        # - Strong (the default).
        # - Bounded staleness.
        # - Exact staleness.
        # If the Cloud Spanner database to be read is geographically distributed,
        # stale read-only transactions can execute more quickly than strong
        # or read-write transaction, because they are able to execute far
        # from the leader replica.
        # Each type of timestamp bound is discussed in detail below.
        # ### Strong
        # Strong reads are guaranteed to see the effects of all transactions
        # that have committed before the start of the read. Furthermore, all
        # rows yielded by a single read are consistent with each other -- if
        # any part of the read observes a transaction, all parts of the read
        # see the transaction.
        # Strong reads are not repeatable: two consecutive strong read-only
        # transactions might return inconsistent results if there are
        # concurrent writes. If consistency across reads is required, the
        # reads should be executed within a transaction or at an exact read
        # timestamp.
        # See TransactionOptions.ReadOnly.strong.
        # ### Exact Staleness
        # These timestamp bounds execute reads at a user-specified
        # timestamp. Reads at a timestamp are guaranteed to see a consistent
        # prefix of the global transaction history: they observe
        # modifications done by all transactions with a commit timestamp <=
        # the read timestamp, and observe none of the modifications done by
        # transactions with a larger commit timestamp. They will block until
        # all conflicting transactions that may be assigned commit timestamps
        # <= the read timestamp have finished.
        # The timestamp can either be expressed as an absolute Cloud Spanner commit
        # timestamp or a staleness relative to the current time.
        # These modes do not require a "negotiation phase" to pick a
        # timestamp. As a result, they execute slightly faster than the
        # equivalent boundedly stale concurrency modes. On the other hand,
        # boundedly stale reads usually return fresher results.
        # See TransactionOptions.ReadOnly.read_timestamp and
        # TransactionOptions.ReadOnly.exact_staleness.
        # ### Bounded Staleness
        # Bounded staleness modes allow Cloud Spanner to pick the read timestamp,
        # subject to a user-provided staleness bound. Cloud Spanner chooses the
        # newest timestamp within the staleness bound that allows execution
        # of the reads at the closest available replica without blocking.
        # All rows yielded are consistent with each other -- if any part of
        # the read observes a transaction, all parts of the read see the
        # transaction. Boundedly stale reads are not repeatable: two stale
        # reads, even if they use the same staleness bound, can execute at
        # different timestamps and thus return inconsistent results.
        # Boundedly stale reads execute in two phases: the first phase
        # negotiates a timestamp among all replicas needed to serve the
        # read. In the second phase, reads are executed at the negotiated
        # timestamp.
        # As a result of the two phase execution, bounded staleness reads are
        # usually a little slower than comparable exact staleness
        # reads. However, they are typically able to return fresher
        # results, and are more likely to execute at the closest replica.
        # Because the timestamp negotiation requires up-front knowledge of
        # which rows will be read, it can only be used with single-use
        # read-only transactions.
        # See TransactionOptions.ReadOnly.max_staleness and
        # TransactionOptions.ReadOnly.min_read_timestamp.
        # ### Old Read Timestamps and Garbage Collection
        # Cloud Spanner continuously garbage collects deleted and overwritten data
        # in the background to reclaim storage space. This process is known
        # as "version GC". By default, version GC reclaims versions after they
        # are one hour old. Because of this, Cloud Spanner cannot perform reads
        # at read timestamps more than one hour in the past. This
        # restriction also applies to in-progress reads and/or SQL queries whose
        # timestamp become too old while executing. Reads and SQL queries with
        # too-old read timestamps fail with the error `FAILED_PRECONDITION`.
        # ## Partitioned DML Transactions
        # Partitioned DML transactions are used to execute DML statements with a
        # different execution strategy that provides different, and often better,
        # scalability properties for large, table-wide operations than DML in a
        # ReadWrite transaction. Smaller scoped statements, such as an OLTP workload,
        # should prefer using ReadWrite transactions.
        # Partitioned DML partitions the keyspace and runs the DML statement on each
        # partition in separate, internal transactions. These transactions commit
        # automatically when complete, and run independently from one another.
        # To reduce lock contention, this execution strategy only acquires read locks
        # on rows that match the WHERE clause of the statement. Additionally, the
        # smaller per-partition transactions hold locks for less time.
        # That said, Partitioned DML is not a drop-in replacement for standard DML used
        # in ReadWrite transactions.
        # - The DML statement must be fully-partitionable. Specifically, the statement
        # must be expressible as the union of many statements which each access only
        # a single row of the table.
        # - The statement is not applied atomically to all rows of the table. Rather,
        # the statement is applied atomically to partitions of the table, in
        # independent transactions. Secondary index rows are updated atomically
        # with the base table rows.
        # - Partitioned DML does not guarantee exactly-once execution semantics
        # against a partition. The statement will be applied at least once to each
        # partition. It is strongly recommended that the DML statement should be
        # idempotent to avoid unexpected results. For instance, it is potentially
        # dangerous to run a statement such as
        # `UPDATE table SET column = column + 1` as it could be run multiple times
        # against some rows.
        # - The partitions are committed automatically - there is no support for
        # Commit or Rollback. If the call returns an error, or if the client issuing
        # the ExecuteSql call dies, it is possible that some rows had the statement
        # executed on them successfully. It is also possible that statement was
        # never executed against other rows.
        # - Partitioned DML transactions may only contain the execution of a single
        # DML statement via ExecuteSql or ExecuteStreamingSql.
        # - If any error is encountered during the execution of the partitioned DML
        # operation (for instance, a UNIQUE INDEX violation, division by zero, or a
        # value that cannot be stored due to schema constraints), then the
        # operation is stopped at that point and an error is returned. It is
        # possible that at this point, some partitions have been committed (or even
        # committed multiple times), and other partitions have not been run at all.
        # Given the above, Partitioned DML is good fit for large, database-wide,
        # operations that are idempotent, such as deleting old rows from a very large
        # table.
        # Corresponds to the JSON property `begin`
        # @return [Google::Apis::SpannerV1::TransactionOptions]
        attr_accessor :begin
      
        # Execute the read or SQL query in a previously-started transaction.
        # Corresponds to the JSON property `id`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :id
      
        # # Transactions
        # Each session can have at most one active transaction at a time. After the
        # active transaction is completed, the session can immediately be
        # re-used for the next transaction. It is not necessary to create a
        # new session for each transaction.
        # # Transaction Modes
        # Cloud Spanner supports three transaction modes:
        # 1. Locking read-write. This type of transaction is the only way
        # to write data into Cloud Spanner. These transactions rely on
        # pessimistic locking and, if necessary, two-phase commit.
        # Locking read-write transactions may abort, requiring the
        # application to retry.
        # 2. Snapshot read-only. This transaction type provides guaranteed
        # consistency across several reads, but does not allow
        # writes. Snapshot read-only transactions can be configured to
        # read at timestamps in the past. Snapshot read-only
        # transactions do not need to be committed.
        # 3. Partitioned DML. This type of transaction is used to execute
        # a single Partitioned DML statement. Partitioned DML partitions
        # the key space and runs the DML statement over each partition
        # in parallel using separate, internal transactions that commit
        # independently. Partitioned DML transactions do not need to be
        # committed.
        # For transactions that only read, snapshot read-only transactions
        # provide simpler semantics and are almost always faster. In
        # particular, read-only transactions do not take locks, so they do
        # not conflict with read-write transactions. As a consequence of not
        # taking locks, they also do not abort, so retry loops are not needed.
        # Transactions may only read/write data in a single database. They
        # may, however, read/write data in different tables within that
        # database.
        # ## Locking Read-Write Transactions
        # Locking transactions may be used to atomically read-modify-write
        # data anywhere in a database. This type of transaction is externally
        # consistent.
        # Clients should attempt to minimize the amount of time a transaction
        # is active. Faster transactions commit with higher probability
        # and cause less contention. Cloud Spanner attempts to keep read locks
        # active as long as the transaction continues to do reads, and the
        # transaction has not been terminated by
        # Commit or
        # Rollback.  Long periods of
        # inactivity at the client may cause Cloud Spanner to release a
        # transaction's locks and abort it.
        # Conceptually, a read-write transaction consists of zero or more
        # reads or SQL statements followed by
        # Commit. At any time before
        # Commit, the client can send a
        # Rollback request to abort the
        # transaction.
        # ### Semantics
        # Cloud Spanner can commit the transaction if all read locks it acquired
        # are still valid at commit time, and it is able to acquire write
        # locks for all writes. Cloud Spanner can abort the transaction for any
        # reason. If a commit attempt returns `ABORTED`, Cloud Spanner guarantees
        # that the transaction has not modified any user data in Cloud Spanner.
        # Unless the transaction commits, Cloud Spanner makes no guarantees about
        # how long the transaction's locks were held for. It is an error to
        # use Cloud Spanner locks for any sort of mutual exclusion other than
        # between Cloud Spanner transactions themselves.
        # ### Retrying Aborted Transactions
        # When a transaction aborts, the application can choose to retry the
        # whole transaction again. To maximize the chances of successfully
        # committing the retry, the client should execute the retry in the
        # same session as the original attempt. The original session's lock
        # priority increases with each consecutive abort, meaning that each
        # attempt has a slightly better chance of success than the previous.
        # Under some circumstances (e.g., many transactions attempting to
        # modify the same row(s)), a transaction can abort many times in a
        # short period before successfully committing. Thus, it is not a good
        # idea to cap the number of retries a transaction can attempt;
        # instead, it is better to limit the total amount of wall time spent
        # retrying.
        # ### Idle Transactions
        # A transaction is considered idle if it has no outstanding reads or
        # SQL queries and has not started a read or SQL query within the last 10
        # seconds. Idle transactions can be aborted by Cloud Spanner so that they
        # don't hold on to locks indefinitely. In that case, the commit will
        # fail with error `ABORTED`.
        # If this behavior is undesirable, periodically executing a simple
        # SQL query in the transaction (e.g., `SELECT 1`) prevents the
        # transaction from becoming idle.
        # ## Snapshot Read-Only Transactions
        # Snapshot read-only transactions provides a simpler method than
        # locking read-write transactions for doing several consistent
        # reads. However, this type of transaction does not support writes.
        # Snapshot transactions do not take locks. Instead, they work by
        # choosing a Cloud Spanner timestamp, then executing all reads at that
        # timestamp. Since they do not acquire locks, they do not block
        # concurrent read-write transactions.
        # Unlike locking read-write transactions, snapshot read-only
        # transactions never abort. They can fail if the chosen read
        # timestamp is garbage collected; however, the default garbage
        # collection policy is generous enough that most applications do not
        # need to worry about this in practice.
        # Snapshot read-only transactions do not need to call
        # Commit or
        # Rollback (and in fact are not
        # permitted to do so).
        # To execute a snapshot transaction, the client specifies a timestamp
        # bound, which tells Cloud Spanner how to choose a read timestamp.
        # The types of timestamp bound are:
        # - Strong (the default).
        # - Bounded staleness.
        # - Exact staleness.
        # If the Cloud Spanner database to be read is geographically distributed,
        # stale read-only transactions can execute more quickly than strong
        # or read-write transaction, because they are able to execute far
        # from the leader replica.
        # Each type of timestamp bound is discussed in detail below.
        # ### Strong
        # Strong reads are guaranteed to see the effects of all transactions
        # that have committed before the start of the read. Furthermore, all
        # rows yielded by a single read are consistent with each other -- if
        # any part of the read observes a transaction, all parts of the read
        # see the transaction.
        # Strong reads are not repeatable: two consecutive strong read-only
        # transactions might return inconsistent results if there are
        # concurrent writes. If consistency across reads is required, the
        # reads should be executed within a transaction or at an exact read
        # timestamp.
        # See TransactionOptions.ReadOnly.strong.
        # ### Exact Staleness
        # These timestamp bounds execute reads at a user-specified
        # timestamp. Reads at a timestamp are guaranteed to see a consistent
        # prefix of the global transaction history: they observe
        # modifications done by all transactions with a commit timestamp <=
        # the read timestamp, and observe none of the modifications done by
        # transactions with a larger commit timestamp. They will block until
        # all conflicting transactions that may be assigned commit timestamps
        # <= the read timestamp have finished.
        # The timestamp can either be expressed as an absolute Cloud Spanner commit
        # timestamp or a staleness relative to the current time.
        # These modes do not require a "negotiation phase" to pick a
        # timestamp. As a result, they execute slightly faster than the
        # equivalent boundedly stale concurrency modes. On the other hand,
        # boundedly stale reads usually return fresher results.
        # See TransactionOptions.ReadOnly.read_timestamp and
        # TransactionOptions.ReadOnly.exact_staleness.
        # ### Bounded Staleness
        # Bounded staleness modes allow Cloud Spanner to pick the read timestamp,
        # subject to a user-provided staleness bound. Cloud Spanner chooses the
        # newest timestamp within the staleness bound that allows execution
        # of the reads at the closest available replica without blocking.
        # All rows yielded are consistent with each other -- if any part of
        # the read observes a transaction, all parts of the read see the
        # transaction. Boundedly stale reads are not repeatable: two stale
        # reads, even if they use the same staleness bound, can execute at
        # different timestamps and thus return inconsistent results.
        # Boundedly stale reads execute in two phases: the first phase
        # negotiates a timestamp among all replicas needed to serve the
        # read. In the second phase, reads are executed at the negotiated
        # timestamp.
        # As a result of the two phase execution, bounded staleness reads are
        # usually a little slower than comparable exact staleness
        # reads. However, they are typically able to return fresher
        # results, and are more likely to execute at the closest replica.
        # Because the timestamp negotiation requires up-front knowledge of
        # which rows will be read, it can only be used with single-use
        # read-only transactions.
        # See TransactionOptions.ReadOnly.max_staleness and
        # TransactionOptions.ReadOnly.min_read_timestamp.
        # ### Old Read Timestamps and Garbage Collection
        # Cloud Spanner continuously garbage collects deleted and overwritten data
        # in the background to reclaim storage space. This process is known
        # as "version GC". By default, version GC reclaims versions after they
        # are one hour old. Because of this, Cloud Spanner cannot perform reads
        # at read timestamps more than one hour in the past. This
        # restriction also applies to in-progress reads and/or SQL queries whose
        # timestamp become too old while executing. Reads and SQL queries with
        # too-old read timestamps fail with the error `FAILED_PRECONDITION`.
        # ## Partitioned DML Transactions
        # Partitioned DML transactions are used to execute DML statements with a
        # different execution strategy that provides different, and often better,
        # scalability properties for large, table-wide operations than DML in a
        # ReadWrite transaction. Smaller scoped statements, such as an OLTP workload,
        # should prefer using ReadWrite transactions.
        # Partitioned DML partitions the keyspace and runs the DML statement on each
        # partition in separate, internal transactions. These transactions commit
        # automatically when complete, and run independently from one another.
        # To reduce lock contention, this execution strategy only acquires read locks
        # on rows that match the WHERE clause of the statement. Additionally, the
        # smaller per-partition transactions hold locks for less time.
        # That said, Partitioned DML is not a drop-in replacement for standard DML used
        # in ReadWrite transactions.
        # - The DML statement must be fully-partitionable. Specifically, the statement
        # must be expressible as the union of many statements which each access only
        # a single row of the table.
        # - The statement is not applied atomically to all rows of the table. Rather,
        # the statement is applied atomically to partitions of the table, in
        # independent transactions. Secondary index rows are updated atomically
        # with the base table rows.
        # - Partitioned DML does not guarantee exactly-once execution semantics
        # against a partition. The statement will be applied at least once to each
        # partition. It is strongly recommended that the DML statement should be
        # idempotent to avoid unexpected results. For instance, it is potentially
        # dangerous to run a statement such as
        # `UPDATE table SET column = column + 1` as it could be run multiple times
        # against some rows.
        # - The partitions are committed automatically - there is no support for
        # Commit or Rollback. If the call returns an error, or if the client issuing
        # the ExecuteSql call dies, it is possible that some rows had the statement
        # executed on them successfully. It is also possible that statement was
        # never executed against other rows.
        # - Partitioned DML transactions may only contain the execution of a single
        # DML statement via ExecuteSql or ExecuteStreamingSql.
        # - If any error is encountered during the execution of the partitioned DML
        # operation (for instance, a UNIQUE INDEX violation, division by zero, or a
        # value that cannot be stored due to schema constraints), then the
        # operation is stopped at that point and an error is returned. It is
        # possible that at this point, some partitions have been committed (or even
        # committed multiple times), and other partitions have not been run at all.
        # Given the above, Partitioned DML is good fit for large, database-wide,
        # operations that are idempotent, such as deleting old rows from a very large
        # table.
        # Corresponds to the JSON property `singleUse`
        # @return [Google::Apis::SpannerV1::TransactionOptions]
        attr_accessor :single_use
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @begin = args[:begin] if args.key?(:begin)
          @id = args[:id] if args.key?(:id)
          @single_use = args[:single_use] if args.key?(:single_use)
        end
      end
      
      # `Type` indicates the type of a Cloud Spanner value, as might be stored in a
      # table cell or returned from an SQL query.
      class Type
        include Google::Apis::Core::Hashable
      
        # `Type` indicates the type of a Cloud Spanner value, as might be stored in a
        # table cell or returned from an SQL query.
        # Corresponds to the JSON property `arrayElementType`
        # @return [Google::Apis::SpannerV1::Type]
        attr_accessor :array_element_type
      
        # Required. The TypeCode for this type.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # `StructType` defines the fields of a STRUCT type.
        # Corresponds to the JSON property `structType`
        # @return [Google::Apis::SpannerV1::StructType]
        attr_accessor :struct_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @array_element_type = args[:array_element_type] if args.key?(:array_element_type)
          @code = args[:code] if args.key?(:code)
          @struct_type = args[:struct_type] if args.key?(:struct_type)
        end
      end
      
      # Metadata type for the operation returned by
      # UpdateDatabaseDdl.
      class UpdateDatabaseDdlMetadata
        include Google::Apis::Core::Hashable
      
        # Reports the commit timestamps of all statements that have
        # succeeded so far, where `commit_timestamps[i]` is the commit
        # timestamp for the statement `statements[i]`.
        # Corresponds to the JSON property `commitTimestamps`
        # @return [Array<String>]
        attr_accessor :commit_timestamps
      
        # The database being modified.
        # Corresponds to the JSON property `database`
        # @return [String]
        attr_accessor :database
      
        # For an update this list contains all the statements. For an
        # individual statement, this list contains only that statement.
        # Corresponds to the JSON property `statements`
        # @return [Array<String>]
        attr_accessor :statements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @commit_timestamps = args[:commit_timestamps] if args.key?(:commit_timestamps)
          @database = args[:database] if args.key?(:database)
          @statements = args[:statements] if args.key?(:statements)
        end
      end
      
      # Enqueues the given DDL statements to be applied, in order but not
      # necessarily all at once, to the database schema at some point (or
      # points) in the future. The server checks that the statements
      # are executable (syntactically valid, name tables that exist, etc.)
      # before enqueueing them, but they may still fail upon
      # later execution (e.g., if a statement from another batch of
      # statements is applied first and it conflicts in some way, or if
      # there is some data-related problem like a `NULL` value in a column to
      # which `NOT NULL` would be added). If a statement fails, all
      # subsequent statements in the batch are automatically cancelled.
      # Each batch of statements is assigned a name which can be used with
      # the Operations API to monitor
      # progress. See the
      # operation_id field for more
      # details.
      class UpdateDatabaseDdlRequest
        include Google::Apis::Core::Hashable
      
        # If empty, the new update request is assigned an
        # automatically-generated operation ID. Otherwise, `operation_id`
        # is used to construct the name of the resulting
        # Operation.
        # Specifying an explicit operation ID simplifies determining
        # whether the statements were executed in the event that the
        # UpdateDatabaseDdl call is replayed,
        # or the return value is otherwise lost: the database and
        # `operation_id` fields can be combined to form the
        # name of the resulting
        # longrunning.Operation: `<database>/operations/<operation_id>`.
        # `operation_id` should be unique within the database, and must be
        # a valid identifier: `a-z*`. Note that
        # automatically-generated operation IDs always begin with an
        # underscore. If the named operation already exists,
        # UpdateDatabaseDdl returns
        # `ALREADY_EXISTS`.
        # Corresponds to the JSON property `operationId`
        # @return [String]
        attr_accessor :operation_id
      
        # DDL statements to be applied to the database.
        # Corresponds to the JSON property `statements`
        # @return [Array<String>]
        attr_accessor :statements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operation_id = args[:operation_id] if args.key?(:operation_id)
          @statements = args[:statements] if args.key?(:statements)
        end
      end
      
      # Metadata type for the operation returned by
      # UpdateInstance.
      class UpdateInstanceMetadata
        include Google::Apis::Core::Hashable
      
        # The time at which this operation was cancelled. If set, this operation is
        # in the process of undoing itself (which is guaranteed to succeed) and
        # cannot be cancelled again.
        # Corresponds to the JSON property `cancelTime`
        # @return [String]
        attr_accessor :cancel_time
      
        # The time at which this operation failed or was completed successfully.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # An isolated set of Cloud Spanner resources on which databases can be hosted.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::SpannerV1::Instance]
        attr_accessor :instance
      
        # The time at which UpdateInstance
        # request was received.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cancel_time = args[:cancel_time] if args.key?(:cancel_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @instance = args[:instance] if args.key?(:instance)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # The request for UpdateInstance.
      class UpdateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Required. A mask specifying which fields in [][google.spanner.admin.instance.
        # v1.UpdateInstanceRequest.instance] should be updated.
        # The field mask must always be specified; this prevents any future fields in
        # [][google.spanner.admin.instance.v1.Instance] from being erased accidentally
        # by clients that do not know
        # about them.
        # Corresponds to the JSON property `fieldMask`
        # @return [String]
        attr_accessor :field_mask
      
        # An isolated set of Cloud Spanner resources on which databases can be hosted.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::SpannerV1::Instance]
        attr_accessor :instance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @field_mask = args[:field_mask] if args.key?(:field_mask)
          @instance = args[:instance] if args.key?(:instance)
        end
      end
      
      # Arguments to insert, update, insert_or_update, and
      # replace operations.
      class Write
        include Google::Apis::Core::Hashable
      
        # The names of the columns in table to be written.
        # The list of columns must contain enough columns to allow
        # Cloud Spanner to derive values for all primary key columns in the
        # row(s) to be modified.
        # Corresponds to the JSON property `columns`
        # @return [Array<String>]
        attr_accessor :columns
      
        # Required. The table whose rows will be written.
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        # The values to be written. `values` can contain more than one
        # list of values. If it does, then multiple rows are written, one
        # for each entry in `values`. Each list in `values` must have
        # exactly as many entries as there are entries in columns
        # above. Sending multiple lists is equivalent to sending multiple
        # `Mutation`s, each containing one `values` entry and repeating
        # table and columns. Individual values in each list are
        # encoded as described here.
        # Corresponds to the JSON property `values`
        # @return [Array<Array<Object>>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @table = args[:table] if args.key?(:table)
          @values = args[:values] if args.key?(:values)
        end
      end
    end
  end
end
