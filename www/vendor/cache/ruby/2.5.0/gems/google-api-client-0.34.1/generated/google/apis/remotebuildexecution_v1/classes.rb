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
    module RemotebuildexecutionV1
      
      # An `Action` captures all the information about an execution which is required
      # to reproduce it.
      # `Action`s are the core component of the [Execution] service. A single
      # `Action` represents a repeatable action that can be performed by the
      # execution service. `Action`s can be succinctly identified by the digest of
      # their wire format encoding and, once an `Action` has been executed, will be
      # cached in the action cache. Future requests can then use the cached result
      # rather than needing to run afresh.
      # When a server completes execution of an
      # Action, it MAY choose to
      # cache the result in
      # the ActionCache unless
      # `do_not_cache` is `true`. Clients SHOULD expect the server to do so. By
      # default, future calls to
      # Execute the same
      # `Action` will also serve their results from the cache. Clients must take care
      # to understand the caching behaviour. Ideally, all `Action`s will be
      # reproducible so that serving a result from cache is always desirable and
      # correct.
      class BuildBazelRemoteExecutionV2Action
        include Google::Apis::Core::Hashable
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `commandDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :command_digest
      
        # If true, then the `Action`'s result cannot be cached, and in-flight
        # requests for the same `Action` may not be merged.
        # Corresponds to the JSON property `doNotCache`
        # @return [Boolean]
        attr_accessor :do_not_cache
        alias_method :do_not_cache?, :do_not_cache
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `inputRootDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :input_root_digest
      
        # A timeout after which the execution should be killed. If the timeout is
        # absent, then the client is specifying that the execution should continue
        # as long as the server will let it. The server SHOULD impose a timeout if
        # the client does not specify one, however, if the client does specify a
        # timeout that is longer than the server's maximum timeout, the server MUST
        # reject the request.
        # The timeout is a part of the
        # Action message, and
        # therefore two `Actions` with different timeouts are different, even if they
        # are otherwise identical. This is because, if they were not, running an
        # `Action` with a lower timeout than is required might result in a cache hit
        # from an execution run with a longer timeout, hiding the fact that the
        # timeout is too short. By encoding it directly in the `Action`, a lower
        # timeout will result in a cache miss and the execution timeout will fail
        # immediately, rather than whenever the cache entry gets evicted.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @command_digest = args[:command_digest] if args.key?(:command_digest)
          @do_not_cache = args[:do_not_cache] if args.key?(:do_not_cache)
          @input_root_digest = args[:input_root_digest] if args.key?(:input_root_digest)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
      # An ActionResult represents the result of an
      # Action being run.
      class BuildBazelRemoteExecutionV2ActionResult
        include Google::Apis::Core::Hashable
      
        # ExecutedActionMetadata contains details about a completed execution.
        # Corresponds to the JSON property `executionMetadata`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2ExecutedActionMetadata]
        attr_accessor :execution_metadata
      
        # The exit code of the command.
        # Corresponds to the JSON property `exitCode`
        # @return [Fixnum]
        attr_accessor :exit_code
      
        # The output directories of the action. For each output directory requested
        # in the `output_directories` field of the Action, if the corresponding
        # directory existed after the action completed, a single entry will be
        # present in the output list, which will contain the digest of a
        # Tree message containing the
        # directory tree, and the path equal exactly to the corresponding Action
        # output_directories member.
        # As an example, suppose the Action had an output directory `a/b/dir` and the
        # execution produced the following contents in `a/b/dir`: a file named `bar`
        # and a directory named `foo` with an executable file named `baz`. Then,
        # output_directory will contain (hashes shortened for readability):
        # ```json
        # // OutputDirectory proto:
        # `
        # path: "a/b/dir"
        # tree_digest: `
        # hash: "4a73bc9d03...",
        # size: 55
        # `
        # `
        # // Tree proto with hash "4a73bc9d03..." and size 55:
        # `
        # root: `
        # files: [
        # `
        # name: "bar",
        # digest: `
        # hash: "4a73bc9d03...",
        # size: 65534
        # `
        # `
        # ],
        # directories: [
        # `
        # name: "foo",
        # digest: `
        # hash: "4cf2eda940...",
        # size: 43
        # `
        # `
        # ]
        # `
        # children : `
        # // (Directory proto with hash "4cf2eda940..." and size 43)
        # files: [
        # `
        # name: "baz",
        # digest: `
        # hash: "b2c941073e...",
        # size: 1294,
        # `,
        # is_executable: true
        # `
        # ]
        # `
        # `
        # ```
        # If an output of the same name was found, but was not a directory, the
        # server will return a FAILED_PRECONDITION.
        # Corresponds to the JSON property `outputDirectories`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2OutputDirectory>]
        attr_accessor :output_directories
      
        # The output directories of the action that are symbolic links to other
        # directories. Those may be links to other output directories, or input
        # directories, or even absolute paths outside of the working directory,
        # if the server supports
        # SymlinkAbsolutePathStrategy.ALLOWED.
        # For each output directory requested in the `output_directories` field of
        # the Action, if the directory existed after the action completed, a
        # single entry will be present either in this field, or in the
        # `output_directories` field, if the directory was not a symbolic link.
        # If an output of the same name was found, but was a symbolic link to a file
        # instead of a directory, the server will return a FAILED_PRECONDITION.
        # If the action does not produce the requested output, then that output
        # will be omitted from the list. The server is free to arrange the output
        # list as desired; clients MUST NOT assume that the output list is sorted.
        # Corresponds to the JSON property `outputDirectorySymlinks`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2OutputSymlink>]
        attr_accessor :output_directory_symlinks
      
        # The output files of the action that are symbolic links to other files. Those
        # may be links to other output files, or input files, or even absolute paths
        # outside of the working directory, if the server supports
        # SymlinkAbsolutePathStrategy.ALLOWED.
        # For each output file requested in the `output_files` field of the Action,
        # if the corresponding file existed after
        # the action completed, a single entry will be present either in this field,
        # or in the `output_files` field, if the file was not a symbolic link.
        # If an output symbolic link of the same name was found, but its target
        # type was not a regular file, the server will return a FAILED_PRECONDITION.
        # If the action does not produce the requested output, then that output
        # will be omitted from the list. The server is free to arrange the output
        # list as desired; clients MUST NOT assume that the output list is sorted.
        # Corresponds to the JSON property `outputFileSymlinks`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2OutputSymlink>]
        attr_accessor :output_file_symlinks
      
        # The output files of the action. For each output file requested in the
        # `output_files` field of the Action, if the corresponding file existed after
        # the action completed, a single entry will be present either in this field,
        # or the `output_file_symlinks` field if the file was a symbolic link to
        # another file.
        # If an output of the same name was found, but was a directory rather
        # than a regular file, the server will return a FAILED_PRECONDITION.
        # If the action does not produce the requested output, then that output
        # will be omitted from the list. The server is free to arrange the output
        # list as desired; clients MUST NOT assume that the output list is sorted.
        # Corresponds to the JSON property `outputFiles`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2OutputFile>]
        attr_accessor :output_files
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `stderrDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :stderr_digest
      
        # The standard error buffer of the action. The server SHOULD NOT inline
        # stderr unless requested by the client in the
        # GetActionResultRequest
        # message. The server MAY omit inlining, even if requested, and MUST do so if
        # inlining
        # would cause the response to exceed message size limits.
        # Corresponds to the JSON property `stderrRaw`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :stderr_raw
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `stdoutDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :stdout_digest
      
        # The standard output buffer of the action. The server SHOULD NOT inline
        # stdout unless requested by the client in the
        # GetActionResultRequest
        # message. The server MAY omit inlining, even if requested, and MUST do so if
        # inlining
        # would cause the response to exceed message size limits.
        # Corresponds to the JSON property `stdoutRaw`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :stdout_raw
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_metadata = args[:execution_metadata] if args.key?(:execution_metadata)
          @exit_code = args[:exit_code] if args.key?(:exit_code)
          @output_directories = args[:output_directories] if args.key?(:output_directories)
          @output_directory_symlinks = args[:output_directory_symlinks] if args.key?(:output_directory_symlinks)
          @output_file_symlinks = args[:output_file_symlinks] if args.key?(:output_file_symlinks)
          @output_files = args[:output_files] if args.key?(:output_files)
          @stderr_digest = args[:stderr_digest] if args.key?(:stderr_digest)
          @stderr_raw = args[:stderr_raw] if args.key?(:stderr_raw)
          @stdout_digest = args[:stdout_digest] if args.key?(:stdout_digest)
          @stdout_raw = args[:stdout_raw] if args.key?(:stdout_raw)
        end
      end
      
      # A `Command` is the actual command executed by a worker running an
      # Action and specifications of its
      # environment.
      # Except as otherwise required, the environment (such as which system
      # libraries or binaries are available, and what filesystems are mounted where)
      # is defined by and specific to the implementation of the remote execution API.
      class BuildBazelRemoteExecutionV2Command
        include Google::Apis::Core::Hashable
      
        # The arguments to the command. The first argument must be the path to the
        # executable, which must be either a relative path, in which case it is
        # evaluated with respect to the input root, or an absolute path.
        # Corresponds to the JSON property `arguments`
        # @return [Array<String>]
        attr_accessor :arguments
      
        # The environment variables to set when running the program. The worker may
        # provide its own default environment variables; these defaults can be
        # overridden using this field. Additional variables can also be specified.
        # In order to ensure that equivalent
        # Commands always hash to the same
        # value, the environment variables MUST be lexicographically sorted by name.
        # Sorting of strings is done by code point, equivalently, by the UTF-8 bytes.
        # Corresponds to the JSON property `environmentVariables`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2CommandEnvironmentVariable>]
        attr_accessor :environment_variables
      
        # A list of the output directories that the client expects to retrieve from
        # the action. Only the listed directories will be returned (an entire
        # directory structure will be returned as a
        # Tree message digest, see
        # OutputDirectory), as
        # well as files listed in `output_files`. Other files or directories that
        # may be created during command execution are discarded.
        # The paths are relative to the working directory of the action execution.
        # The paths are specified using a single forward slash (`/`) as a path
        # separator, even if the execution platform natively uses a different
        # separator. The path MUST NOT include a trailing slash, nor a leading slash,
        # being a relative path. The special value of empty string is allowed,
        # although not recommended, and can be used to capture the entire working
        # directory tree, including inputs.
        # In order to ensure consistent hashing of the same Action, the output paths
        # MUST be sorted lexicographically by code point (or, equivalently, by UTF-8
        # bytes).
        # An output directory cannot be duplicated or have the same path as any of
        # the listed output files. An output directory is allowed to be a parent of
        # another output directory.
        # Directories leading up to the output directories (but not the output
        # directories themselves) are created by the worker prior to execution, even
        # if they are not explicitly part of the input root.
        # Corresponds to the JSON property `outputDirectories`
        # @return [Array<String>]
        attr_accessor :output_directories
      
        # A list of the output files that the client expects to retrieve from the
        # action. Only the listed files, as well as directories listed in
        # `output_directories`, will be returned to the client as output.
        # Other files or directories that may be created during command execution
        # are discarded.
        # The paths are relative to the working directory of the action execution.
        # The paths are specified using a single forward slash (`/`) as a path
        # separator, even if the execution platform natively uses a different
        # separator. The path MUST NOT include a trailing slash, nor a leading slash,
        # being a relative path.
        # In order to ensure consistent hashing of the same Action, the output paths
        # MUST be sorted lexicographically by code point (or, equivalently, by UTF-8
        # bytes).
        # An output file cannot be duplicated, be a parent of another output file, or
        # have the same path as any of the listed output directories.
        # Directories leading up to the output files are created by the worker prior
        # to execution, even if they are not explicitly part of the input root.
        # Corresponds to the JSON property `outputFiles`
        # @return [Array<String>]
        attr_accessor :output_files
      
        # A `Platform` is a set of requirements, such as hardware, operating system, or
        # compiler toolchain, for an
        # Action's execution
        # environment. A `Platform` is represented as a series of key-value pairs
        # representing the properties that are required of the platform.
        # Corresponds to the JSON property `platform`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Platform]
        attr_accessor :platform
      
        # The working directory, relative to the input root, for the command to run
        # in. It must be a directory which exists in the input tree. If it is left
        # empty, then the action is run in the input root.
        # Corresponds to the JSON property `workingDirectory`
        # @return [String]
        attr_accessor :working_directory
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @environment_variables = args[:environment_variables] if args.key?(:environment_variables)
          @output_directories = args[:output_directories] if args.key?(:output_directories)
          @output_files = args[:output_files] if args.key?(:output_files)
          @platform = args[:platform] if args.key?(:platform)
          @working_directory = args[:working_directory] if args.key?(:working_directory)
        end
      end
      
      # An `EnvironmentVariable` is one variable to set in the running program's
      # environment.
      class BuildBazelRemoteExecutionV2CommandEnvironmentVariable
        include Google::Apis::Core::Hashable
      
        # The variable name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The variable value.
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
      
      # A content digest. A digest for a given blob consists of the size of the blob
      # and its hash. The hash algorithm to use is defined by the server, but servers
      # SHOULD use SHA-256.
      # The size is considered to be an integral part of the digest and cannot be
      # separated. That is, even if the `hash` field is correctly specified but
      # `size_bytes` is not, the server MUST reject the request.
      # The reason for including the size in the digest is as follows: in a great
      # many cases, the server needs to know the size of the blob it is about to work
      # with prior to starting an operation with it, such as flattening Merkle tree
      # structures or streaming it to a worker. Technically, the server could
      # implement a separate metadata store, but this results in a significantly more
      # complicated implementation as opposed to having the client specify the size
      # up-front (or storing the size along with the digest in every message where
      # digests are embedded). This does mean that the API leaks some implementation
      # details of (what we consider to be) a reasonable server implementation, but
      # we consider this to be a worthwhile tradeoff.
      # When a `Digest` is used to refer to a proto message, it always refers to the
      # message in binary encoded form. To ensure consistent hashing, clients and
      # servers MUST ensure that they serialize messages according to the following
      # rules, even if there are alternate valid encodings for the same message:
      # * Fields are serialized in tag order.
      # * There are no unknown fields.
      # * There are no duplicate fields.
      # * Fields are serialized according to the default semantics for their type.
      # Most protocol buffer implementations will always follow these rules when
      # serializing, but care should be taken to avoid shortcuts. For instance,
      # concatenating two messages to merge them may produce duplicate fields.
      class BuildBazelRemoteExecutionV2Digest
        include Google::Apis::Core::Hashable
      
        # The hash. In the case of SHA-256, it will always be a lowercase hex string
        # exactly 64 characters long.
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # The size of the blob, in bytes.
        # Corresponds to the JSON property `sizeBytes`
        # @return [Fixnum]
        attr_accessor :size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @size_bytes = args[:size_bytes] if args.key?(:size_bytes)
        end
      end
      
      # A `Directory` represents a directory node in a file tree, containing zero or
      # more children FileNodes,
      # DirectoryNodes and
      # SymlinkNodes.
      # Each `Node` contains its name in the directory, either the digest of its
      # content (either a file blob or a `Directory` proto) or a symlink target, as
      # well as possibly some metadata about the file or directory.
      # In order to ensure that two equivalent directory trees hash to the same
      # value, the following restrictions MUST be obeyed when constructing a
      # a `Directory`:
      # * Every child in the directory must have a path of exactly one segment.
      # Multiple levels of directory hierarchy may not be collapsed.
      # * Each child in the directory must have a unique path segment (file name).
      # Note that while the API itself is case-sensitive, the environment where
      # the Action is executed may or may not be case-sensitive. That is, it is
      # legal to call the API with a Directory that has both "Foo" and "foo" as
      # children, but the Action may be rejected by the remote system upon
      # execution.
      # * The files, directories and symlinks in the directory must each be sorted
      # in lexicographical order by path. The path strings must be sorted by code
      # point, equivalently, by UTF-8 bytes.
      # A `Directory` that obeys the restrictions is said to be in canonical form.
      # As an example, the following could be used for a file named `bar` and a
      # directory named `foo` with an executable file named `baz` (hashes shortened
      # for readability):
      # ```json
      # // (Directory proto)
      # `
      # files: [
      # `
      # name: "bar",
      # digest: `
      # hash: "4a73bc9d03...",
      # size: 65534
      # `
      # `
      # ],
      # directories: [
      # `
      # name: "foo",
      # digest: `
      # hash: "4cf2eda940...",
      # size: 43
      # `
      # `
      # ]
      # `
      # // (Directory proto with hash "4cf2eda940..." and size 43)
      # `
      # files: [
      # `
      # name: "baz",
      # digest: `
      # hash: "b2c941073e...",
      # size: 1294,
      # `,
      # is_executable: true
      # `
      # ]
      # `
      # ```
      class BuildBazelRemoteExecutionV2Directory
        include Google::Apis::Core::Hashable
      
        # The subdirectories in the directory.
        # Corresponds to the JSON property `directories`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2DirectoryNode>]
        attr_accessor :directories
      
        # The files in the directory.
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2FileNode>]
        attr_accessor :files
      
        # The symlinks in the directory.
        # Corresponds to the JSON property `symlinks`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2SymlinkNode>]
        attr_accessor :symlinks
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directories = args[:directories] if args.key?(:directories)
          @files = args[:files] if args.key?(:files)
          @symlinks = args[:symlinks] if args.key?(:symlinks)
        end
      end
      
      # A `DirectoryNode` represents a child of a
      # Directory which is itself
      # a `Directory` and its associated metadata.
      class BuildBazelRemoteExecutionV2DirectoryNode
        include Google::Apis::Core::Hashable
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :digest
      
        # The name of the directory.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digest = args[:digest] if args.key?(:digest)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metadata about an ongoing
      # execution, which
      # will be contained in the metadata
      # field of the
      # Operation.
      class BuildBazelRemoteExecutionV2ExecuteOperationMetadata
        include Google::Apis::Core::Hashable
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `actionDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :action_digest
      
        # The current stage of execution.
        # Corresponds to the JSON property `stage`
        # @return [String]
        attr_accessor :stage
      
        # If set, the client can use this name with
        # ByteStream.Read to stream the
        # standard error.
        # Corresponds to the JSON property `stderrStreamName`
        # @return [String]
        attr_accessor :stderr_stream_name
      
        # If set, the client can use this name with
        # ByteStream.Read to stream the
        # standard output.
        # Corresponds to the JSON property `stdoutStreamName`
        # @return [String]
        attr_accessor :stdout_stream_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_digest = args[:action_digest] if args.key?(:action_digest)
          @stage = args[:stage] if args.key?(:stage)
          @stderr_stream_name = args[:stderr_stream_name] if args.key?(:stderr_stream_name)
          @stdout_stream_name = args[:stdout_stream_name] if args.key?(:stdout_stream_name)
        end
      end
      
      # The response message for
      # Execution.Execute,
      # which will be contained in the response
      # field of the
      # Operation.
      class BuildBazelRemoteExecutionV2ExecuteResponse
        include Google::Apis::Core::Hashable
      
        # True if the result was served from cache, false if it was executed.
        # Corresponds to the JSON property `cachedResult`
        # @return [Boolean]
        attr_accessor :cached_result
        alias_method :cached_result?, :cached_result
      
        # Freeform informational message with details on the execution of the action
        # that may be displayed to the user upon failure or when requested explicitly.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # An ActionResult represents the result of an
        # Action being run.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2ActionResult]
        attr_accessor :result
      
        # An optional list of additional log outputs the server wishes to provide. A
        # server can use this to return execution-specific logs however it wishes.
        # This is intended primarily to make it easier for users to debug issues that
        # may be outside of the actual job execution, such as by identifying the
        # worker executing the action or by providing logs from the worker's setup
        # phase. The keys SHOULD be human readable so that a client can display them
        # to a user.
        # Corresponds to the JSON property `serverLogs`
        # @return [Hash<String,Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2LogFile>]
        attr_accessor :server_logs
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleRpcStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cached_result = args[:cached_result] if args.key?(:cached_result)
          @message = args[:message] if args.key?(:message)
          @result = args[:result] if args.key?(:result)
          @server_logs = args[:server_logs] if args.key?(:server_logs)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # ExecutedActionMetadata contains details about a completed execution.
      class BuildBazelRemoteExecutionV2ExecutedActionMetadata
        include Google::Apis::Core::Hashable
      
        # When the worker completed executing the action command.
        # Corresponds to the JSON property `executionCompletedTimestamp`
        # @return [String]
        attr_accessor :execution_completed_timestamp
      
        # When the worker started executing the action command.
        # Corresponds to the JSON property `executionStartTimestamp`
        # @return [String]
        attr_accessor :execution_start_timestamp
      
        # When the worker finished fetching action inputs.
        # Corresponds to the JSON property `inputFetchCompletedTimestamp`
        # @return [String]
        attr_accessor :input_fetch_completed_timestamp
      
        # When the worker started fetching action inputs.
        # Corresponds to the JSON property `inputFetchStartTimestamp`
        # @return [String]
        attr_accessor :input_fetch_start_timestamp
      
        # When the worker finished uploading action outputs.
        # Corresponds to the JSON property `outputUploadCompletedTimestamp`
        # @return [String]
        attr_accessor :output_upload_completed_timestamp
      
        # When the worker started uploading action outputs.
        # Corresponds to the JSON property `outputUploadStartTimestamp`
        # @return [String]
        attr_accessor :output_upload_start_timestamp
      
        # When was the action added to the queue.
        # Corresponds to the JSON property `queuedTimestamp`
        # @return [String]
        attr_accessor :queued_timestamp
      
        # The name of the worker which ran the execution.
        # Corresponds to the JSON property `worker`
        # @return [String]
        attr_accessor :worker
      
        # When the worker completed the action, including all stages.
        # Corresponds to the JSON property `workerCompletedTimestamp`
        # @return [String]
        attr_accessor :worker_completed_timestamp
      
        # When the worker received the action.
        # Corresponds to the JSON property `workerStartTimestamp`
        # @return [String]
        attr_accessor :worker_start_timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_completed_timestamp = args[:execution_completed_timestamp] if args.key?(:execution_completed_timestamp)
          @execution_start_timestamp = args[:execution_start_timestamp] if args.key?(:execution_start_timestamp)
          @input_fetch_completed_timestamp = args[:input_fetch_completed_timestamp] if args.key?(:input_fetch_completed_timestamp)
          @input_fetch_start_timestamp = args[:input_fetch_start_timestamp] if args.key?(:input_fetch_start_timestamp)
          @output_upload_completed_timestamp = args[:output_upload_completed_timestamp] if args.key?(:output_upload_completed_timestamp)
          @output_upload_start_timestamp = args[:output_upload_start_timestamp] if args.key?(:output_upload_start_timestamp)
          @queued_timestamp = args[:queued_timestamp] if args.key?(:queued_timestamp)
          @worker = args[:worker] if args.key?(:worker)
          @worker_completed_timestamp = args[:worker_completed_timestamp] if args.key?(:worker_completed_timestamp)
          @worker_start_timestamp = args[:worker_start_timestamp] if args.key?(:worker_start_timestamp)
        end
      end
      
      # A `FileNode` represents a single file and associated metadata.
      class BuildBazelRemoteExecutionV2FileNode
        include Google::Apis::Core::Hashable
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :digest
      
        # True if file is executable, false otherwise.
        # Corresponds to the JSON property `isExecutable`
        # @return [Boolean]
        attr_accessor :is_executable
        alias_method :is_executable?, :is_executable
      
        # The name of the file.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digest = args[:digest] if args.key?(:digest)
          @is_executable = args[:is_executable] if args.key?(:is_executable)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A `LogFile` is a log stored in the CAS.
      class BuildBazelRemoteExecutionV2LogFile
        include Google::Apis::Core::Hashable
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :digest
      
        # This is a hint as to the purpose of the log, and is set to true if the log
        # is human-readable text that can be usefully displayed to a user, and false
        # otherwise. For instance, if a command-line client wishes to print the
        # server logs to the terminal for a failed action, this allows it to avoid
        # displaying a binary file.
        # Corresponds to the JSON property `humanReadable`
        # @return [Boolean]
        attr_accessor :human_readable
        alias_method :human_readable?, :human_readable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digest = args[:digest] if args.key?(:digest)
          @human_readable = args[:human_readable] if args.key?(:human_readable)
        end
      end
      
      # An `OutputDirectory` is the output in an `ActionResult` corresponding to a
      # directory's full contents rather than a single file.
      class BuildBazelRemoteExecutionV2OutputDirectory
        include Google::Apis::Core::Hashable
      
        # The full path of the directory relative to the working directory. The path
        # separator is a forward slash `/`. Since this is a relative path, it MUST
        # NOT begin with a leading forward slash. The empty string value is allowed,
        # and it denotes the entire working directory.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `treeDigest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :tree_digest
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @path = args[:path] if args.key?(:path)
          @tree_digest = args[:tree_digest] if args.key?(:tree_digest)
        end
      end
      
      # An `OutputFile` is similar to a
      # FileNode, but it is used as an
      # output in an `ActionResult`. It allows a full file path rather than
      # only a name.
      class BuildBazelRemoteExecutionV2OutputFile
        include Google::Apis::Core::Hashable
      
        # The contents of the file if inlining was requested. The server SHOULD NOT
        # inline
        # file contents unless requested by the client in the
        # GetActionResultRequest
        # message. The server MAY omit inlining, even if requested, and MUST do so if
        # inlining
        # would cause the response to exceed message size limits.
        # Corresponds to the JSON property `contents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :contents
      
        # A content digest. A digest for a given blob consists of the size of the blob
        # and its hash. The hash algorithm to use is defined by the server, but servers
        # SHOULD use SHA-256.
        # The size is considered to be an integral part of the digest and cannot be
        # separated. That is, even if the `hash` field is correctly specified but
        # `size_bytes` is not, the server MUST reject the request.
        # The reason for including the size in the digest is as follows: in a great
        # many cases, the server needs to know the size of the blob it is about to work
        # with prior to starting an operation with it, such as flattening Merkle tree
        # structures or streaming it to a worker. Technically, the server could
        # implement a separate metadata store, but this results in a significantly more
        # complicated implementation as opposed to having the client specify the size
        # up-front (or storing the size along with the digest in every message where
        # digests are embedded). This does mean that the API leaks some implementation
        # details of (what we consider to be) a reasonable server implementation, but
        # we consider this to be a worthwhile tradeoff.
        # When a `Digest` is used to refer to a proto message, it always refers to the
        # message in binary encoded form. To ensure consistent hashing, clients and
        # servers MUST ensure that they serialize messages according to the following
        # rules, even if there are alternate valid encodings for the same message:
        # * Fields are serialized in tag order.
        # * There are no unknown fields.
        # * There are no duplicate fields.
        # * Fields are serialized according to the default semantics for their type.
        # Most protocol buffer implementations will always follow these rules when
        # serializing, but care should be taken to avoid shortcuts. For instance,
        # concatenating two messages to merge them may produce duplicate fields.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Digest]
        attr_accessor :digest
      
        # True if file is executable, false otherwise.
        # Corresponds to the JSON property `isExecutable`
        # @return [Boolean]
        attr_accessor :is_executable
        alias_method :is_executable?, :is_executable
      
        # The full path of the file relative to the working directory, including the
        # filename. The path separator is a forward slash `/`. Since this is a
        # relative path, it MUST NOT begin with a leading forward slash.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contents = args[:contents] if args.key?(:contents)
          @digest = args[:digest] if args.key?(:digest)
          @is_executable = args[:is_executable] if args.key?(:is_executable)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # An `OutputSymlink` is similar to a
      # Symlink, but it is used as an
      # output in an `ActionResult`.
      # `OutputSymlink` is binary-compatible with `SymlinkNode`.
      class BuildBazelRemoteExecutionV2OutputSymlink
        include Google::Apis::Core::Hashable
      
        # The full path of the symlink relative to the working directory, including the
        # filename. The path separator is a forward slash `/`. Since this is a
        # relative path, it MUST NOT begin with a leading forward slash.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The target path of the symlink. The path separator is a forward slash `/`.
        # The target path can be relative to the parent directory of the symlink or
        # it can be an absolute path starting with `/`. Support for absolute paths
        # can be checked using the Capabilities
        # API. The canonical form forbids the substrings `/./` and `//` in the target
        # path. `..` components are allowed anywhere in the target path.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @path = args[:path] if args.key?(:path)
          @target = args[:target] if args.key?(:target)
        end
      end
      
      # A `Platform` is a set of requirements, such as hardware, operating system, or
      # compiler toolchain, for an
      # Action's execution
      # environment. A `Platform` is represented as a series of key-value pairs
      # representing the properties that are required of the platform.
      class BuildBazelRemoteExecutionV2Platform
        include Google::Apis::Core::Hashable
      
        # The properties that make up this platform. In order to ensure that
        # equivalent `Platform`s always hash to the same value, the properties MUST
        # be lexicographically sorted by name, and then by value. Sorting of strings
        # is done by code point, equivalently, by the UTF-8 bytes.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2PlatformProperty>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A single property for the environment. The server is responsible for
      # specifying the property `name`s that it accepts. If an unknown `name` is
      # provided in the requirements for an
      # Action, the server SHOULD
      # reject the execution request. If permitted by the server, the same `name`
      # may occur multiple times.
      # The server is also responsible for specifying the interpretation of
      # property `value`s. For instance, a property describing how much RAM must be
      # available may be interpreted as allowing a worker with 16GB to fulfill a
      # request for 8GB, while a property describing the OS environment on which
      # the action must be performed may require an exact match with the worker's
      # OS.
      # The server MAY use the `value` of one or more properties to determine how
      # it sets up the execution environment, such as by making specific system
      # files available to the worker.
      class BuildBazelRemoteExecutionV2PlatformProperty
        include Google::Apis::Core::Hashable
      
        # The property name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The property value.
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
      
      # An optional Metadata to attach to any RPC request to tell the server about an
      # external context of the request. The server may use this for logging or other
      # purposes. To use it, the client attaches the header to the call using the
      # canonical proto serialization:
      # * name: `build.bazel.remote.execution.v2.requestmetadata-bin`
      # * contents: the base64 encoded binary `RequestMetadata` message.
      # Note: the gRPC library serializes binary headers encoded in base 64 by
      # default (https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md#
      # requests).
      # Therefore, if the gRPC library is used to pass/retrieve this
      # metadata, the user may ignore the base64 encoding and assume it is simply
      # serialized as a binary message.
      class BuildBazelRemoteExecutionV2RequestMetadata
        include Google::Apis::Core::Hashable
      
        # An identifier that ties multiple requests to the same action.
        # For example, multiple requests to the CAS, Action Cache, and Execution
        # API are used in order to compile foo.cc.
        # Corresponds to the JSON property `actionId`
        # @return [String]
        attr_accessor :action_id
      
        # An identifier to tie multiple tool invocations together. For example,
        # runs of foo_test, bar_test and baz_test on a post-submit of a given patch.
        # Corresponds to the JSON property `correlatedInvocationsId`
        # @return [String]
        attr_accessor :correlated_invocations_id
      
        # Details for the tool used to call the API.
        # Corresponds to the JSON property `toolDetails`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2ToolDetails]
        attr_accessor :tool_details
      
        # An identifier that ties multiple actions together to a final result.
        # For example, multiple actions are required to build and run foo_test.
        # Corresponds to the JSON property `toolInvocationId`
        # @return [String]
        attr_accessor :tool_invocation_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_id = args[:action_id] if args.key?(:action_id)
          @correlated_invocations_id = args[:correlated_invocations_id] if args.key?(:correlated_invocations_id)
          @tool_details = args[:tool_details] if args.key?(:tool_details)
          @tool_invocation_id = args[:tool_invocation_id] if args.key?(:tool_invocation_id)
        end
      end
      
      # A `SymlinkNode` represents a symbolic link.
      class BuildBazelRemoteExecutionV2SymlinkNode
        include Google::Apis::Core::Hashable
      
        # The name of the symlink.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The target path of the symlink. The path separator is a forward slash `/`.
        # The target path can be relative to the parent directory of the symlink or
        # it can be an absolute path starting with `/`. Support for absolute paths
        # can be checked using the Capabilities
        # API. The canonical form forbids the substrings `/./` and `//` in the target
        # path. `..` components are allowed anywhere in the target path.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @target = args[:target] if args.key?(:target)
        end
      end
      
      # Details for the tool used to call the API.
      class BuildBazelRemoteExecutionV2ToolDetails
        include Google::Apis::Core::Hashable
      
        # Name of the tool, e.g. bazel.
        # Corresponds to the JSON property `toolName`
        # @return [String]
        attr_accessor :tool_name
      
        # Version of the tool used for the request, e.g. 5.0.3.
        # Corresponds to the JSON property `toolVersion`
        # @return [String]
        attr_accessor :tool_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tool_name = args[:tool_name] if args.key?(:tool_name)
          @tool_version = args[:tool_version] if args.key?(:tool_version)
        end
      end
      
      # A `Tree` contains all the
      # Directory protos in a
      # single directory Merkle tree, compressed into one message.
      class BuildBazelRemoteExecutionV2Tree
        include Google::Apis::Core::Hashable
      
        # All the child directories: the directories referred to by the root and,
        # recursively, all its children. In order to reconstruct the directory tree,
        # the client must take the digests of each of the child directories and then
        # build up a tree starting from the `root`.
        # Corresponds to the JSON property `children`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Directory>]
        attr_accessor :children
      
        # A `Directory` represents a directory node in a file tree, containing zero or
        # more children FileNodes,
        # DirectoryNodes and
        # SymlinkNodes.
        # Each `Node` contains its name in the directory, either the digest of its
        # content (either a file blob or a `Directory` proto) or a symlink target, as
        # well as possibly some metadata about the file or directory.
        # In order to ensure that two equivalent directory trees hash to the same
        # value, the following restrictions MUST be obeyed when constructing a
        # a `Directory`:
        # * Every child in the directory must have a path of exactly one segment.
        # Multiple levels of directory hierarchy may not be collapsed.
        # * Each child in the directory must have a unique path segment (file name).
        # Note that while the API itself is case-sensitive, the environment where
        # the Action is executed may or may not be case-sensitive. That is, it is
        # legal to call the API with a Directory that has both "Foo" and "foo" as
        # children, but the Action may be rejected by the remote system upon
        # execution.
        # * The files, directories and symlinks in the directory must each be sorted
        # in lexicographical order by path. The path strings must be sorted by code
        # point, equivalently, by UTF-8 bytes.
        # A `Directory` that obeys the restrictions is said to be in canonical form.
        # As an example, the following could be used for a file named `bar` and a
        # directory named `foo` with an executable file named `baz` (hashes shortened
        # for readability):
        # ```json
        # // (Directory proto)
        # `
        # files: [
        # `
        # name: "bar",
        # digest: `
        # hash: "4a73bc9d03...",
        # size: 65534
        # `
        # `
        # ],
        # directories: [
        # `
        # name: "foo",
        # digest: `
        # hash: "4cf2eda940...",
        # size: 43
        # `
        # `
        # ]
        # `
        # // (Directory proto with hash "4cf2eda940..." and size 43)
        # `
        # files: [
        # `
        # name: "baz",
        # digest: `
        # hash: "b2c941073e...",
        # size: 1294,
        # `,
        # is_executable: true
        # `
        # ]
        # `
        # ```
        # Corresponds to the JSON property `root`
        # @return [Google::Apis::RemotebuildexecutionV1::BuildBazelRemoteExecutionV2Directory]
        attr_accessor :root
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @children = args[:children] if args.key?(:children)
          @root = args[:root] if args.key?(:root)
        end
      end
      
      # Media resource.
      class GoogleBytestreamMedia
        include Google::Apis::Core::Hashable
      
        # Name of the media resource.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # CommandDuration contains the various duration metrics tracked when a bot
      # performs a command.
      class GoogleDevtoolsRemotebuildbotCommandDurations
        include Google::Apis::Core::Hashable
      
        # The time spent preparing the command to be run in a Docker container
        # (includes pulling the Docker image, if necessary).
        # Corresponds to the JSON property `dockerPrep`
        # @return [String]
        attr_accessor :docker_prep
      
        # The timestamp when docker prepartion begins.
        # Corresponds to the JSON property `dockerPrepStartTime`
        # @return [String]
        attr_accessor :docker_prep_start_time
      
        # The time spent downloading the input files and constructing the working
        # directory.
        # Corresponds to the JSON property `download`
        # @return [String]
        attr_accessor :download
      
        # The timestamp when downloading the input files begins.
        # Corresponds to the JSON property `downloadStartTime`
        # @return [String]
        attr_accessor :download_start_time
      
        # The timestamp when execution begins.
        # Corresponds to the JSON property `execStartTime`
        # @return [String]
        attr_accessor :exec_start_time
      
        # The time spent executing the command (i.e., doing useful work).
        # Corresponds to the JSON property `execution`
        # @return [String]
        attr_accessor :execution
      
        # The timestamp when preparation is done and bot starts downloading files.
        # Corresponds to the JSON property `isoPrepDone`
        # @return [String]
        attr_accessor :iso_prep_done
      
        # The time spent completing the command, in total.
        # Corresponds to the JSON property `overall`
        # @return [String]
        attr_accessor :overall
      
        # The time spent uploading the stdout logs.
        # Corresponds to the JSON property `stdout`
        # @return [String]
        attr_accessor :stdout
      
        # The time spent uploading the output files.
        # Corresponds to the JSON property `upload`
        # @return [String]
        attr_accessor :upload
      
        # The timestamp when uploading the output files begins.
        # Corresponds to the JSON property `uploadStartTime`
        # @return [String]
        attr_accessor :upload_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @docker_prep = args[:docker_prep] if args.key?(:docker_prep)
          @docker_prep_start_time = args[:docker_prep_start_time] if args.key?(:docker_prep_start_time)
          @download = args[:download] if args.key?(:download)
          @download_start_time = args[:download_start_time] if args.key?(:download_start_time)
          @exec_start_time = args[:exec_start_time] if args.key?(:exec_start_time)
          @execution = args[:execution] if args.key?(:execution)
          @iso_prep_done = args[:iso_prep_done] if args.key?(:iso_prep_done)
          @overall = args[:overall] if args.key?(:overall)
          @stdout = args[:stdout] if args.key?(:stdout)
          @upload = args[:upload] if args.key?(:upload)
          @upload_start_time = args[:upload_start_time] if args.key?(:upload_start_time)
        end
      end
      
      # CommandEvents contains counters for the number of warnings and errors
      # that occurred during the execution of a command.
      class GoogleDevtoolsRemotebuildbotCommandEvents
        include Google::Apis::Core::Hashable
      
        # Indicates whether we are using a cached Docker image (true) or had to pull
        # the Docker image (false) for this command.
        # Corresponds to the JSON property `dockerCacheHit`
        # @return [Boolean]
        attr_accessor :docker_cache_hit
        alias_method :docker_cache_hit?, :docker_cache_hit
      
        # The input cache miss ratio.
        # Corresponds to the JSON property `inputCacheMiss`
        # @return [Float]
        attr_accessor :input_cache_miss
      
        # The number of errors reported.
        # Corresponds to the JSON property `numErrors`
        # @return [Fixnum]
        attr_accessor :num_errors
      
        # The number of warnings reported.
        # Corresponds to the JSON property `numWarnings`
        # @return [Fixnum]
        attr_accessor :num_warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @docker_cache_hit = args[:docker_cache_hit] if args.key?(:docker_cache_hit)
          @input_cache_miss = args[:input_cache_miss] if args.key?(:input_cache_miss)
          @num_errors = args[:num_errors] if args.key?(:num_errors)
          @num_warnings = args[:num_warnings] if args.key?(:num_warnings)
        end
      end
      
      # The internal status of the command result.
      class GoogleDevtoolsRemotebuildbotCommandStatus
        include Google::Apis::Core::Hashable
      
        # The status code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # The error message.
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
      
      # AcceleratorConfig defines the accelerator cards to attach to the VM.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig
        include Google::Apis::Core::Hashable
      
        # The number of guest accelerator cards exposed to each VM.
        # Corresponds to the JSON property `acceleratorCount`
        # @return [Fixnum]
        attr_accessor :accelerator_count
      
        # The type of accelerator to attach to each VM, e.g. "nvidia-tesla-k80" for
        # nVidia Tesla K80.
        # Corresponds to the JSON property `acceleratorType`
        # @return [String]
        attr_accessor :accelerator_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_count = args[:accelerator_count] if args.key?(:accelerator_count)
          @accelerator_type = args[:accelerator_type] if args.key?(:accelerator_type)
        end
      end
      
      # The request used for `CreateInstance`.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Instance conceptually encapsulates all Remote Build Execution resources
        # for remote builds.
        # An instance consists of storage and compute resources (for example,
        # `ContentAddressableStorage`, `ActionCache`, `WorkerPools`) used for
        # running remote builds.
        # All Remote Build Execution API calls are scoped to an instance.
        # Corresponds to the JSON property `instance`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance]
        attr_accessor :instance
      
        # ID of the created instance.
        # A valid `instance_id` must:
        # be 6-50 characters long,
        # contain only lowercase letters, digits, hyphens and underscores,
        # start with a lowercase letter, and
        # end with a lowercase letter or a digit.
        # Corresponds to the JSON property `instanceId`
        # @return [String]
        attr_accessor :instance_id
      
        # Resource name of the project containing the instance.
        # Format: `projects/[PROJECT_ID]`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance = args[:instance] if args.key?(:instance)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # The request used for `CreateWorkerPool`.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateWorkerPoolRequest
        include Google::Apis::Core::Hashable
      
        # Resource name of the instance in which to create the new worker pool.
        # Format: `projects/[PROJECT_ID]/instances/[INSTANCE_ID]`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # ID of the created worker pool.
        # A valid pool ID must:
        # be 6-50 characters long,
        # contain only lowercase letters, digits, hyphens and underscores,
        # start with a lowercase letter, and
        # end with a lowercase letter or a digit.
        # Corresponds to the JSON property `poolId`
        # @return [String]
        attr_accessor :pool_id
      
        # A worker pool resource in the Remote Build Execution API.
        # Corresponds to the JSON property `workerPool`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool]
        attr_accessor :worker_pool
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
          @pool_id = args[:pool_id] if args.key?(:pool_id)
          @worker_pool = args[:worker_pool] if args.key?(:worker_pool)
        end
      end
      
      # The request used for `DeleteInstance`.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Name of the instance to delete.
        # Format: `projects/[PROJECT_ID]/instances/[INSTANCE_ID]`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The request used for DeleteWorkerPool.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteWorkerPoolRequest
        include Google::Apis::Core::Hashable
      
        # Name of the worker pool to delete.
        # Format:
        # `projects/[PROJECT_ID]/instances/[INSTANCE_ID]/workerpools/[POOL_ID]`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The request used for `GetInstance`.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetInstanceRequest
        include Google::Apis::Core::Hashable
      
        # Name of the instance to retrieve.
        # Format: `projects/[PROJECT_ID]/instances/[INSTANCE_ID]`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The request used for GetWorkerPool.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetWorkerPoolRequest
        include Google::Apis::Core::Hashable
      
        # Name of the worker pool to retrieve.
        # Format:
        # `projects/[PROJECT_ID]/instances/[INSTANCE_ID]/workerpools/[POOL_ID]`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Instance conceptually encapsulates all Remote Build Execution resources
      # for remote builds.
      # An instance consists of storage and compute resources (for example,
      # `ContentAddressableStorage`, `ActionCache`, `WorkerPools`) used for
      # running remote builds.
      # All Remote Build Execution API calls are scoped to an instance.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance
        include Google::Apis::Core::Hashable
      
        # The location is a GCP region. Currently only `us-central1` is supported.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Output only. Whether stack driver logging is enabled for the instance.
        # Corresponds to the JSON property `loggingEnabled`
        # @return [Boolean]
        attr_accessor :logging_enabled
        alias_method :logging_enabled?, :logging_enabled
      
        # Output only. Instance resource name formatted as:
        # `projects/[PROJECT_ID]/instances/[INSTANCE_ID]`.
        # Name should not be populated when creating an instance since it is provided
        # in the `instance_id` field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. State of the instance.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @logging_enabled = args[:logging_enabled] if args.key?(:logging_enabled)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # 
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesRequest
        include Google::Apis::Core::Hashable
      
        # Resource name of the project.
        # Format: `projects/[PROJECT_ID]`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # 
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesResponse
        include Google::Apis::Core::Hashable
      
        # The list of instances in a given project.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance>]
        attr_accessor :instances
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instances = args[:instances] if args.key?(:instances)
        end
      end
      
      # 
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsRequest
        include Google::Apis::Core::Hashable
      
        # Optional. A filter expression that filters resources listed in
        # the response. The expression must specify the field name, a comparison
        # operator, and the value that you want to use for filtering. The value
        # must be a string, a number, or a boolean. String values are
        # case-insensitive.
        # The comparison operator must be either `:`, `=`, `!=`, `>`, `>=`, `<=` or
        # `<`.
        # The `:` operator can be used with string fields to match substrings.
        # For non-string fields it is equivalent to the `=` operator.
        # The `:*` comparison can be used to test  whether a key has been defined.
        # You can also filter on nested fields.
        # To filter on multiple expressions, you can separate expression using
        # `AND` and `OR` operators, using parentheses to specify precedence. If
        # neither operator is specified, `AND` is assumed.
        # Examples:
        # Include only pools with more than 100 reserved workers:
        # `(worker_count > 100) (worker_config.reserved = true)`
        # Include only pools with a certain label or machines of the n1-standard
        # family:
        # `worker_config.labels.key1 : * OR worker_config.machine_type: n1-standard`
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # Resource name of the instance.
        # Format: `projects/[PROJECT_ID]/instances/[INSTANCE_ID]`.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @parent = args[:parent] if args.key?(:parent)
        end
      end
      
      # 
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsResponse
        include Google::Apis::Core::Hashable
      
        # The list of worker pools in a given instance.
        # Corresponds to the JSON property `workerPools`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool>]
        attr_accessor :worker_pools
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @worker_pools = args[:worker_pools] if args.key?(:worker_pools)
        end
      end
      
      # The request used for UpdateWorkerPool.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaUpdateWorkerPoolRequest
        include Google::Apis::Core::Hashable
      
        # The update mask applies to worker_pool. For the `FieldMask` definition,
        # see
        # https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#
        # fieldmask
        # If an empty update_mask is provided, only the non-default valued field in
        # the worker pool field will be updated. Note that in order to update a field
        # to the default value (zero, false, empty string) an explicit update_mask
        # must be provided.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        # A worker pool resource in the Remote Build Execution API.
        # Corresponds to the JSON property `workerPool`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool]
        attr_accessor :worker_pool
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
          @worker_pool = args[:worker_pool] if args.key?(:worker_pool)
        end
      end
      
      # Defines the configuration to be used for a creating workers in
      # the worker pool.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig
        include Google::Apis::Core::Hashable
      
        # AcceleratorConfig defines the accelerator cards to attach to the VM.
        # Corresponds to the JSON property `accelerator`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig]
        attr_accessor :accelerator
      
        # Required. Size of the disk attached to the worker, in GB.
        # See https://cloud.google.com/compute/docs/disks/
        # Corresponds to the JSON property `diskSizeGb`
        # @return [Fixnum]
        attr_accessor :disk_size_gb
      
        # Required. Disk Type to use for the worker.
        # See [Storage
        # options](https://cloud.google.com/compute/docs/disks/#introduction).
        # Currently only `pd-standard` is supported.
        # Corresponds to the JSON property `diskType`
        # @return [String]
        attr_accessor :disk_type
      
        # Labels associated with the workers.
        # Label keys and values can be no longer than 63 characters, can only contain
        # lowercase letters, numeric characters, underscores and dashes.
        # International letters are permitted. Label keys must start with a letter.
        # Label values are optional.
        # There can not be more than 64 labels per resource.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. Machine type of the worker, such as `n1-standard-2`.
        # See https://cloud.google.com/compute/docs/machine-types for a list of
        # supported machine types. Note that `f1-micro` and `g1-small` are not yet
        # supported.
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # Minimum CPU platform to use when creating the worker.
        # See [CPU Platforms](https://cloud.google.com/compute/docs/cpu-platforms).
        # Corresponds to the JSON property `minCpuPlatform`
        # @return [String]
        attr_accessor :min_cpu_platform
      
        # Determines the type of network access granted to workers. Possible values:
        # - "public": Workers can connect to the public internet.
        # - "private": Workers can only connect to Google APIs and services.
        # - "restricted-private": Workers can only connect to Google APIs that are
        # reachable through `restricted.googleapis.com` (`199.36.153.4/30`).
        # Corresponds to the JSON property `networkAccess`
        # @return [String]
        attr_accessor :network_access
      
        # Determines whether the worker is reserved (equivalent to a Compute Engine
        # on-demand VM and therefore won't be preempted).
        # See [Preemptible VMs](https://cloud.google.com/preemptible-vms/) for more
        # details.
        # Corresponds to the JSON property `reserved`
        # @return [Boolean]
        attr_accessor :reserved
        alias_method :reserved?, :reserved
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator = args[:accelerator] if args.key?(:accelerator)
          @disk_size_gb = args[:disk_size_gb] if args.key?(:disk_size_gb)
          @disk_type = args[:disk_type] if args.key?(:disk_type)
          @labels = args[:labels] if args.key?(:labels)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @min_cpu_platform = args[:min_cpu_platform] if args.key?(:min_cpu_platform)
          @network_access = args[:network_access] if args.key?(:network_access)
          @reserved = args[:reserved] if args.key?(:reserved)
        end
      end
      
      # A worker pool resource in the Remote Build Execution API.
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool
        include Google::Apis::Core::Hashable
      
        # WorkerPool resource name formatted as:
        # `projects/[PROJECT_ID]/instances/[INSTANCE_ID]/workerpools/[POOL_ID]`.
        # name should not be populated when creating a worker pool since it is
        # provided in the `poolId` field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. State of the worker pool.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Defines the configuration to be used for a creating workers in
        # the worker pool.
        # Corresponds to the JSON property `workerConfig`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig]
        attr_accessor :worker_config
      
        # The desired number of workers in the worker pool. Must be a value between
        # 0 and 1000.
        # Corresponds to the JSON property `workerCount`
        # @return [Fixnum]
        attr_accessor :worker_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @state = args[:state] if args.key?(:state)
          @worker_config = args[:worker_config] if args.key?(:worker_config)
          @worker_count = args[:worker_count] if args.key?(:worker_count)
        end
      end
      
      # AdminTemp is a prelimiary set of administration tasks. It's called "Temp"
      # because we do not yet know the best way to represent admin tasks; it's
      # possible that this will be entirely replaced in later versions of this API.
      # If this message proves to be sufficient, it will be renamed in the alpha or
      # beta release of this API.
      # This message (suitably marshalled into a protobuf.Any) can be used as the
      # inline_assignment field in a lease; the lease assignment field should simply
      # be `"admin"` in these cases.
      # This message is heavily based on Swarming administration tasks from the LUCI
      # project (http://github.com/luci/luci-py/appengine/swarming).
      class GoogleDevtoolsRemoteworkersV1test2AdminTemp
        include Google::Apis::Core::Hashable
      
        # The argument to the admin action; see `Command` for semantics.
        # Corresponds to the JSON property `arg`
        # @return [String]
        attr_accessor :arg
      
        # The admin action; see `Command` for legal values.
        # Corresponds to the JSON property `command`
        # @return [String]
        attr_accessor :command
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arg = args[:arg] if args.key?(:arg)
          @command = args[:command] if args.key?(:command)
        end
      end
      
      # Describes a blob of binary content with its digest.
      class GoogleDevtoolsRemoteworkersV1test2Blob
        include Google::Apis::Core::Hashable
      
        # The contents of the blob.
        # Corresponds to the JSON property `contents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :contents
      
        # The CommandTask and CommandResult messages assume the existence of a service
        # that can serve blobs of content, identified by a hash and size known as a
        # "digest." The method by which these blobs may be retrieved is not specified
        # here, but a model implementation is in the Remote Execution API's
        # "ContentAddressibleStorage" interface.
        # In the context of the RWAPI, a Digest will virtually always refer to the
        # contents of a file or a directory. The latter is represented by the
        # byte-encoded Directory message.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest]
        attr_accessor :digest
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contents = args[:contents] if args.key?(:contents)
          @digest = args[:digest] if args.key?(:digest)
        end
      end
      
      # DEPRECATED - use CommandResult instead.
      # Describes the actual outputs from the task.
      class GoogleDevtoolsRemoteworkersV1test2CommandOutputs
        include Google::Apis::Core::Hashable
      
        # exit_code is only fully reliable if the status' code is OK. If the task
        # exceeded its deadline or was cancelled, the process may still produce an
        # exit code as it is cancelled, and this will be populated, but a successful
        # (zero) is unlikely to be correct unless the status code is OK.
        # Corresponds to the JSON property `exitCode`
        # @return [Fixnum]
        attr_accessor :exit_code
      
        # The CommandTask and CommandResult messages assume the existence of a service
        # that can serve blobs of content, identified by a hash and size known as a
        # "digest." The method by which these blobs may be retrieved is not specified
        # here, but a model implementation is in the Remote Execution API's
        # "ContentAddressibleStorage" interface.
        # In the context of the RWAPI, a Digest will virtually always refer to the
        # contents of a file or a directory. The latter is represented by the
        # byte-encoded Directory message.
        # Corresponds to the JSON property `outputs`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest]
        attr_accessor :outputs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exit_code = args[:exit_code] if args.key?(:exit_code)
          @outputs = args[:outputs] if args.key?(:outputs)
        end
      end
      
      # DEPRECATED - use CommandResult instead.
      # Can be used as part of CompleteRequest.metadata, or are part of a more
      # sophisticated message.
      class GoogleDevtoolsRemoteworkersV1test2CommandOverhead
        include Google::Apis::Core::Hashable
      
        # The elapsed time between calling Accept and Complete. The server will also
        # have its own idea of what this should be, but this excludes the overhead of
        # the RPCs and the bot response time.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # The amount of time *not* spent executing the command (ie
        # uploading/downloading files).
        # Corresponds to the JSON property `overhead`
        # @return [String]
        attr_accessor :overhead
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @overhead = args[:overhead] if args.key?(:overhead)
        end
      end
      
      # All information about the execution of a command, suitable for providing as
      # the Bots interface's `Lease.result` field.
      class GoogleDevtoolsRemoteworkersV1test2CommandResult
        include Google::Apis::Core::Hashable
      
        # The elapsed time between calling Accept and Complete. The server will also
        # have its own idea of what this should be, but this excludes the overhead of
        # the RPCs and the bot response time.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # The exit code of the process. An exit code of "0" should only be trusted if
        # `status` has a code of OK (otherwise it may simply be unset).
        # Corresponds to the JSON property `exitCode`
        # @return [Fixnum]
        attr_accessor :exit_code
      
        # Implementation-dependent metadata about the task. Both servers and bots
        # may define messages which can be encoded here; bots are free to provide
        # metadata in multiple formats, and servers are free to choose one or more
        # of the values to process and ignore others. In particular, it is *not*
        # considered an error for the bot to provide the server with a field that it
        # doesn't know about.
        # Corresponds to the JSON property `metadata`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :metadata
      
        # The CommandTask and CommandResult messages assume the existence of a service
        # that can serve blobs of content, identified by a hash and size known as a
        # "digest." The method by which these blobs may be retrieved is not specified
        # here, but a model implementation is in the Remote Execution API's
        # "ContentAddressibleStorage" interface.
        # In the context of the RWAPI, a Digest will virtually always refer to the
        # contents of a file or a directory. The latter is represented by the
        # byte-encoded Directory message.
        # Corresponds to the JSON property `outputs`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest]
        attr_accessor :outputs
      
        # The amount of time *not* spent executing the command (ie
        # uploading/downloading files).
        # Corresponds to the JSON property `overhead`
        # @return [String]
        attr_accessor :overhead
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleRpcStatus]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @exit_code = args[:exit_code] if args.key?(:exit_code)
          @metadata = args[:metadata] if args.key?(:metadata)
          @outputs = args[:outputs] if args.key?(:outputs)
          @overhead = args[:overhead] if args.key?(:overhead)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Describes a shell-style task to execute, suitable for providing as the Bots
      # interface's `Lease.payload` field.
      class GoogleDevtoolsRemoteworkersV1test2CommandTask
        include Google::Apis::Core::Hashable
      
        # Describes the expected outputs of the command.
        # Corresponds to the JSON property `expectedOutputs`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs]
        attr_accessor :expected_outputs
      
        # Describes the inputs to a shell-style task.
        # Corresponds to the JSON property `inputs`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs]
        attr_accessor :inputs
      
        # Describes the timeouts associated with this task.
        # Corresponds to the JSON property `timeouts`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts]
        attr_accessor :timeouts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expected_outputs = args[:expected_outputs] if args.key?(:expected_outputs)
          @inputs = args[:inputs] if args.key?(:inputs)
          @timeouts = args[:timeouts] if args.key?(:timeouts)
        end
      end
      
      # Describes the inputs to a shell-style task.
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs
        include Google::Apis::Core::Hashable
      
        # The command itself to run (e.g., argv).
        # This field should be passed directly to the underlying operating system,
        # and so it must be sensible to that operating system. For example, on
        # Windows, the first argument might be "C:\Windows\System32\ping.exe" -
        # that is, using drive letters and backslashes. A command for a *nix
        # system, on the other hand, would use forward slashes.
        # All other fields in the RWAPI must consistently use forward slashes,
        # since those fields may be interpretted by both the service and the bot.
        # Corresponds to the JSON property `arguments`
        # @return [Array<String>]
        attr_accessor :arguments
      
        # All environment variables required by the task.
        # Corresponds to the JSON property `environmentVariables`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable>]
        attr_accessor :environment_variables
      
        # The input filesystem to be set up prior to the task beginning. The
        # contents should be a repeated set of FileMetadata messages though other
        # formats are allowed if better for the implementation (eg, a LUCI-style
        # .isolated file).
        # This field is repeated since implementations might want to cache the
        # metadata, in which case it may be useful to break up portions of the
        # filesystem that change frequently (eg, specific input files) from those
        # that don't (eg, standard header files).
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest>]
        attr_accessor :files
      
        # Inline contents for blobs expected to be needed by the bot to execute the
        # task. For example, contents of entries in `files` or blobs that are
        # indirectly referenced by an entry there.
        # The bot should check against this list before downloading required task
        # inputs to reduce the number of communications between itself and the
        # remote CAS server.
        # Corresponds to the JSON property `inlineBlobs`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Blob>]
        attr_accessor :inline_blobs
      
        # Directory from which a command is executed. It is a relative directory
        # with respect to the bot's working directory (i.e., "./"). If it is
        # non-empty, then it must exist under "./". Otherwise, "./" will be used.
        # Corresponds to the JSON property `workingDirectory`
        # @return [String]
        attr_accessor :working_directory
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @arguments = args[:arguments] if args.key?(:arguments)
          @environment_variables = args[:environment_variables] if args.key?(:environment_variables)
          @files = args[:files] if args.key?(:files)
          @inline_blobs = args[:inline_blobs] if args.key?(:inline_blobs)
          @working_directory = args[:working_directory] if args.key?(:working_directory)
        end
      end
      
      # An environment variable required by this task.
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable
        include Google::Apis::Core::Hashable
      
        # The envvar name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The envvar value.
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
      
      # Describes the expected outputs of the command.
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs
        include Google::Apis::Core::Hashable
      
        # A list of expected directories, relative to the execution root. All paths
        # MUST be delimited by forward slashes.
        # Corresponds to the JSON property `directories`
        # @return [Array<String>]
        attr_accessor :directories
      
        # A list of expected files, relative to the execution root. All paths
        # MUST be delimited by forward slashes.
        # Corresponds to the JSON property `files`
        # @return [Array<String>]
        attr_accessor :files
      
        # The destination to which any stderr should be sent. The method by which
        # the bot should send the stream contents to that destination is not
        # defined in this API. As examples, the destination could be a file
        # referenced in the `files` field in this message, or it could be a URI
        # that must be written via the ByteStream API.
        # Corresponds to the JSON property `stderrDestination`
        # @return [String]
        attr_accessor :stderr_destination
      
        # The destination to which any stdout should be sent. The method by which
        # the bot should send the stream contents to that destination is not
        # defined in this API. As examples, the destination could be a file
        # referenced in the `files` field in this message, or it could be a URI
        # that must be written via the ByteStream API.
        # Corresponds to the JSON property `stdoutDestination`
        # @return [String]
        attr_accessor :stdout_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directories = args[:directories] if args.key?(:directories)
          @files = args[:files] if args.key?(:files)
          @stderr_destination = args[:stderr_destination] if args.key?(:stderr_destination)
          @stdout_destination = args[:stdout_destination] if args.key?(:stdout_destination)
        end
      end
      
      # Describes the timeouts associated with this task.
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts
        include Google::Apis::Core::Hashable
      
        # This specifies the maximum time that the task can run, excluding the
        # time required to download inputs or upload outputs. That is, the worker
        # will terminate the task if it runs longer than this.
        # Corresponds to the JSON property `execution`
        # @return [String]
        attr_accessor :execution
      
        # This specifies the maximum amount of time the task can be idle - that is,
        # go without generating some output in either stdout or stderr. If the
        # process is silent for more than the specified time, the worker will
        # terminate the task.
        # Corresponds to the JSON property `idle`
        # @return [String]
        attr_accessor :idle
      
        # If the execution or IO timeouts are exceeded, the worker will try to
        # gracefully terminate the task and return any existing logs. However,
        # tasks may be hard-frozen in which case this process will fail. This
        # timeout specifies how long to wait for a terminated task to shut down
        # gracefully (e.g. via SIGTERM) before we bring down the hammer (e.g.
        # SIGKILL on *nix, CTRL_BREAK_EVENT on Windows).
        # Corresponds to the JSON property `shutdown`
        # @return [String]
        attr_accessor :shutdown
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution = args[:execution] if args.key?(:execution)
          @idle = args[:idle] if args.key?(:idle)
          @shutdown = args[:shutdown] if args.key?(:shutdown)
        end
      end
      
      # The CommandTask and CommandResult messages assume the existence of a service
      # that can serve blobs of content, identified by a hash and size known as a
      # "digest." The method by which these blobs may be retrieved is not specified
      # here, but a model implementation is in the Remote Execution API's
      # "ContentAddressibleStorage" interface.
      # In the context of the RWAPI, a Digest will virtually always refer to the
      # contents of a file or a directory. The latter is represented by the
      # byte-encoded Directory message.
      class GoogleDevtoolsRemoteworkersV1test2Digest
        include Google::Apis::Core::Hashable
      
        # A string-encoded hash (eg "1a2b3c", not the byte array [0x1a, 0x2b, 0x3c])
        # using an implementation-defined hash algorithm (eg SHA-256).
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # The size of the contents. While this is not strictly required as part of an
        # identifier (after all, any given hash will have exactly one canonical
        # size), it's useful in almost all cases when one might want to send or
        # retrieve blobs of content and is included here for this reason.
        # Corresponds to the JSON property `sizeBytes`
        # @return [Fixnum]
        attr_accessor :size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @size_bytes = args[:size_bytes] if args.key?(:size_bytes)
        end
      end
      
      # The contents of a directory. Similar to the equivalent message in the Remote
      # Execution API.
      class GoogleDevtoolsRemoteworkersV1test2Directory
        include Google::Apis::Core::Hashable
      
        # Any subdirectories
        # Corresponds to the JSON property `directories`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata>]
        attr_accessor :directories
      
        # The files in this directory
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2FileMetadata>]
        attr_accessor :files
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directories = args[:directories] if args.key?(:directories)
          @files = args[:files] if args.key?(:files)
        end
      end
      
      # The metadata for a directory. Similar to the equivalent message in the Remote
      # Execution API.
      class GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata
        include Google::Apis::Core::Hashable
      
        # The CommandTask and CommandResult messages assume the existence of a service
        # that can serve blobs of content, identified by a hash and size known as a
        # "digest." The method by which these blobs may be retrieved is not specified
        # here, but a model implementation is in the Remote Execution API's
        # "ContentAddressibleStorage" interface.
        # In the context of the RWAPI, a Digest will virtually always refer to the
        # contents of a file or a directory. The latter is represented by the
        # byte-encoded Directory message.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest]
        attr_accessor :digest
      
        # The path of the directory, as in FileMetadata.path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @digest = args[:digest] if args.key?(:digest)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # The metadata for a file. Similar to the equivalent message in the Remote
      # Execution API.
      class GoogleDevtoolsRemoteworkersV1test2FileMetadata
        include Google::Apis::Core::Hashable
      
        # If the file is small enough, its contents may also or alternatively be
        # listed here.
        # Corresponds to the JSON property `contents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :contents
      
        # The CommandTask and CommandResult messages assume the existence of a service
        # that can serve blobs of content, identified by a hash and size known as a
        # "digest." The method by which these blobs may be retrieved is not specified
        # here, but a model implementation is in the Remote Execution API's
        # "ContentAddressibleStorage" interface.
        # In the context of the RWAPI, a Digest will virtually always refer to the
        # contents of a file or a directory. The latter is represented by the
        # byte-encoded Directory message.
        # Corresponds to the JSON property `digest`
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleDevtoolsRemoteworkersV1test2Digest]
        attr_accessor :digest
      
        # Properties of the file
        # Corresponds to the JSON property `isExecutable`
        # @return [Boolean]
        attr_accessor :is_executable
        alias_method :is_executable?, :is_executable
      
        # The path of this file. If this message is part of the
        # CommandOutputs.outputs fields, the path is relative to the execution root
        # and must correspond to an entry in CommandTask.outputs.files. If this
        # message is part of a Directory message, then the path is relative to the
        # root of that directory. All paths MUST be delimited by forward slashes.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contents = args[:contents] if args.key?(:contents)
          @digest = args[:digest] if args.key?(:digest)
          @is_executable = args[:is_executable] if args.key?(:is_executable)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # The request message for Operations.CancelOperation.
      class GoogleLongrunningCancelOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The response message for Operations.ListOperations.
      class GoogleLongrunningListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::RemotebuildexecutionV1::GoogleLongrunningOperation>]
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
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
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
        # @return [Google::Apis::RemotebuildexecutionV1::GoogleRpcStatus]
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
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
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
    end
  end
end
