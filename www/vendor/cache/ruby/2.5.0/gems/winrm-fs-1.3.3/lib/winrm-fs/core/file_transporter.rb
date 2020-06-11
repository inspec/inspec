# frozen_string_literal: false

#
# Author:: Fletcher (<fnichol@nichol.ca>)
#
# Copyright (C) 2015, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'benchmark'
require 'csv'
require 'digest'
require 'securerandom'
require 'stringio'

require 'winrm/exceptions'
require 'winrm-fs/core/tmp_zip'

module WinRM
  module FS
    module Core
      # Wrapped exception for any internally raised WinRM-related errors.
      #
      # @author Fletcher Nichol <fnichol@nichol.ca>
      class FileTransporterFailed < ::WinRM::WinRMError; end
      # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/ClassLength

      # Exception for the case where upload source contains more than one
      # StringIO object, or a combination of file/directory paths and StringIO object
      class UploadSourceError < StandardError
        def initialize(msg = 'Only a single StringIO object may be uploaded.')
          super
        end
      end

      # Object which can upload one or more files or directories to a remote
      # host over WinRM using PowerShell scripts and CMD commands. Note that
      # this form of file transfer is *not* ideal and extremely costly on both
      # the local and remote sides. Great pains are made to minimize round
      # trips to  the remote host and to minimize the number of PowerShell
      # sessions being invoked which can be 2 orders of magnitude more
      # expensive than vanilla CMD commands.
      #
      # This object is supported by a `PowerShell` instance as it
      # depends on the `#run` API contract.
      #
      # An optional logger can be supplied, assuming it can respond to the
      # `#debug` and `#debug?` messages.
      #
      # @author Fletcher Nichol <fnichol@nichol.ca>
      # @author Matt Wrock <matt@mattwrock.com>
      class FileTransporter
        # Creates a FileTransporter given a PowerShell object.
        #
        # @param shell [PowerShell] a winrm PowerShell object
        def initialize(shell, opts = {})
          @shell  = shell
          @logger = shell.logger
          @id_generator = opts.fetch(:id_generator) { -> { SecureRandom.uuid } }
          Zip.unicode_names = true
        end

        # Uploads a collection of files and/or directories to the remote host.
        #
        # **TODO Notes:**
        # * options could specify zip mode, zip options, etc.
        # * maybe option to set tmpfile base dir to override $env:PATH?
        # * progress yields block like net-scp progress
        # * final API: def upload(locals, remote, _options = {}, &_progress)
        #
        # @param locals [Array<String>,String,StringIO] one or more
        #   local file or directory paths, StringIO objects also accepted
        # @param remote [String] the base destination path on the remote host
        # @return [Hash] report hash, keyed by the local SHA1 digest
        def upload(locals, remote)
          files = nil
          report = nil
          remote = remote.to_s
          elapsed1 = Benchmark.measure do
            files = make_files_hash([locals].flatten, remote)
            report = check_files(files)
            merge_with_report!(files, report)
            reconcile_destinations!(files)
          end
          total_size = total_base64_transfer_size(files)

          elapsed2 = Benchmark.measure do
            report = stream_upload_files(files) do |local_path, xfered|
              yield xfered, total_size, local_path, remote if block_given?
            end
            merge_with_report!(files, report)
          end

          elapsed3 = Benchmark.measure do
            report = extract_files(files)
            merge_with_report!(files, report)
            cleanup(files)
          end

          logger.debug(
            "Uploaded #{files.keys.size} items " \
            "dirty_check: #{duration(elapsed1.real)} " \
            "stream_files: #{duration(elapsed2.real)} " \
            "extract: #{duration(elapsed3.real)} " \
          )

          [total_size, files]
        end

        private

        # @return [String] the Array pack template for Base64 encoding a stream
        #   of data
        # @api private
        BASE64_PACK = 'm0'.freeze

        # @return [String] the directory where temporary upload artifacts are
        #   persisted
        # @api private
        TEMP_UPLOAD_DIRECTORY = '$env:TEMP\\winrm-upload'.freeze

        # @return [#debug,#debug?] the logger
        # @api private
        attr_reader :logger

        # @return [Winrm::Shells::Powershell] a WinRM Powershell shell
        # @api private
        attr_reader :shell

        # @return [Integer] the maximum number of bytes to send per request
        #   when streaming a file. This is optimized to send as much data
        #   as allowed in a single PSRP fragment
        # @api private
        def max_encoded_write
          @max_encoded_write ||= begin
            empty_command = WinRM::PSRP::MessageFactory.create_pipeline_message(
              '00000000-0000-0000-0000-000000000000',
              '00000000-0000-0000-0000-000000000000',
              stream_command('')
            )
            shell.max_fragment_blob_size - empty_command.bytes.length
          end
        end

        # Examines the files and corrects the file destination if it is
        # targeting an existing folder. In this case, the destination path
        # will have the base name of the source file appended. This only
        # applies to file uploads and not to folder uploads.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [Hash] a report hash, keyed by the local SHA1 digest
        # @api private
        def reconcile_destinations!(files)
          files.each do |_, data|
            data['dst'] = File.join(data['dst'], File.basename(data['src'])) if data['target_is_folder'] == 'True'
          end
        end

        # Adds an entry to a files Hash (keyed by local SHA1 digest) for a
        # directory. When a directory is added, a temporary Zip file is created
        # containing the contents of the directory and any file-related data
        # such as SHA1 digest, size, etc. will be referring to the Zip file.
        #
        # @param hash [Hash] hash to be mutated
        # @param dir [String] directory path to be Zipped and added
        # @param remote [String] path to destination on remote host
        # @api private
        def add_directory_hash!(hash, dir, remote)
          logger.debug "creating hash for directory #{remote}"
          zip_io = TmpZip.new(dir, logger)
          zip_sha1 = sha1sum(zip_io.path)

          hash[zip_sha1] = {
            'src' => dir,
            'src_zip' => zip_io.path.to_s,
            'zip_io' => zip_io,
            'tmpzip' => "#{TEMP_UPLOAD_DIRECTORY}\\tmpzip-#{zip_sha1}.zip",
            'dst' => "#{remote}\\#{File.basename(dir)}",
            'size' => File.size(zip_io.path)
          }
        end

        # Adds an entry to a files Hash (keyed by local SHA1 digest) for a file.
        #
        # @param hash [Hash] hash to be mutated
        # @param local [String, StringIO] file path or StringIO object
        # @param remote [String] path to destination on remote host
        # @api private
        def add_file_hash!(hash, local, remote)
          logger.debug "creating hash for file #{remote}"
          hash[sha1sum(local)] = {
            'src' => local,
            'dst' => remote,
            'size' => local.is_a?(StringIO) ? local.size : File.size(local)
          }
        end

        # Runs the check_files PowerShell script against a collection of
        # destination path/SHA1 checksum pairs. The PowerShell script returns
        # its results as a CSV-formatted report which is converted into a Ruby
        # Hash.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [Hash] a report hash, keyed by the local SHA1 digest
        # @api private
        def check_files(files)
          logger.debug 'Running check_files.ps1'
          hash_file = check_files_ps_hash(files)
          script = WinRM::FS::Scripts.render('check_files', hash_file: hash_file)
          parse_response(shell.run(script))
        end

        # Constructs a collection of destination path/SHA1 checksum pairs as a
        # String representation of the contents of a PowerShell Hash Table.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [String] the inner contents of a PowerShell Hash Table
        # @api private
        def check_files_ps_hash(files)
          hash = files.map do |sha1, data|
            [
              sha1,
              {
                'target' => data.fetch('tmpzip', data['dst']),
                'src_basename' => data['src'].is_a?(StringIO) ? data['dst'] : File.basename(data['src']),
                'dst' => data['dst']
              }
            ]
          end
          ps_hash(Hash[hash])
        end

        # Performs any final cleanup on the report Hash and removes any
        # temporary files/resources used in the upload task.
        #
        # @param files [Hash] a files hash
        # @api private
        def cleanup(files)
          files.select { |_, data| data.key?('zip_io') }.each do |sha1, data|
            data.fetch('zip_io').unlink
            files.fetch(sha1).delete('zip_io')
            logger.debug "Cleaned up src_zip #{data['src_zip']}"
          end
        end

        # Runs the extract_files PowerShell script against a collection of
        # temporary file/destination path pairs. The PowerShell script returns
        # its results as a CSV-formatted report which is converted into a Ruby
        # Hash. The script will not be invoked if there are no zip files
        # present in the incoming files Hash.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [Hash] a report hash, keyed by the local SHA1 digest
        # @api private
        def extract_files(files)
          extracted_files = extract_files_ps_hash(files)

          if extracted_files == ps_hash({})
            logger.debug 'No remote files to extract, skipping'
            {}
          else
            logger.debug 'Running extract_files.ps1'
            script = WinRM::FS::Scripts.render('extract_files', hash_file: extracted_files)

            parse_response(shell.run(script))
          end
        end

        # Constructs a collection of temporary file/destination path pairs for
        # all zipped folders as a String representation of the contents of a
        # PowerShell Hash Table.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [String] the inner contents of a PowerShell Hash Table
        # @api private
        def extract_files_ps_hash(files)
          file_data = files.select { |_, data| data.key?('tmpzip') }

          result = file_data.map do |sha1, data|
            val = { 'dst' => data['dst'] }
            val['tmpzip'] = data['tmpzip'] if data['tmpzip']

            [sha1, val]
          end

          ps_hash(Hash[result])
        end

        # Returns a formatted string representing a duration in seconds.
        #
        # @param total [Integer] the total number of seconds
        # @return [String] a formatted string of the form (XmYY.00s)
        def duration(total)
          total = 0 if total.nil?
          minutes = (total / 60).to_i
          seconds = (total - (minutes * 60))
          format('(%dm%.2fs)', minutes, seconds)
        end

        # Contructs a Hash of files or directories, keyed by the local SHA1
        # digest. Each file entry has a source and destination set, at a
        # minimum.
        #
        # @param locals [Array<String,StringIO>] a collection of local files,
        #   directories or StringIO objects
        # @param remote [String] the base destination path on the remote host
        # @return [Hash] files hash, keyed by the local SHA1 digest
        # @api private
        def make_files_hash(locals, remote)
          hash = {}
          check_locals_array(locals)
          locals.each do |local|
            if local.is_a?(StringIO)
              add_file_hash!(hash, local, remote)
            else
              local = local.to_s
              expanded = File.expand_path(local)
              expanded += local[-1] if local.end_with?('/', '\\')
              if File.file?(expanded)
                add_file_hash!(hash, expanded, remote)
              elsif File.directory?(expanded)
                add_directory_hash!(hash, expanded, remote)
              else
                raise Errno::ENOENT, "No such file or directory #{expanded}"
              end
            end
          end
          hash
        end

        # Ensure that only a single StringIO object is uploaded at a time
        # This is necessary because the contents of the buffer will be written
        # to the destination.
        # @param locals [Array<String,StringIO>] a collection of local files,
        #   directories or StringIO objects
        # @api private
        def check_locals_array(locals)
          string_io = false
          path = false
          locals.each do |local|
            raise UploadSourceError if string_io

            if local.is_a?(StringIO)
              string_io = true
            else
              path = true
            end
            raise UploadSourceError if string_io && path
          end
        end

        # @return [String] the SHA1 digest of a local file or StringIO
        # @api private
        def sha1sum(local)
          if local.is_a?(StringIO)
            Digest::SHA1.hexdigest(local.string)
          else
            Digest::SHA1.file(local).hexdigest
          end
        end

        # Destructively merges a report Hash into an existing files Hash.
        # **Note:** this method mutates the files Hash.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @param report [Hash] report hash, keyed by the local SHA1 digest
        # @api private
        def merge_with_report!(files, report)
          files.merge!(report) { |_, oldval, newval| oldval.merge(newval) }
        end

        # @param depth [Integer] number of padding characters (default: `0`)
        # @return [String] a whitespace padded string of the given length
        # @api private
        def pad(depth = 0)
          ' ' * depth
        end

        # Parses response of a PowerShell script or CMD command which contains
        # a CSV-formatted document in the standard output stream.
        #
        # @param output [WinRM::Output] output object with stdout, stderr, and
        #   exit code
        # @return [Hash] report hash, keyed by the local SHA1 digest
        # @api private
        def parse_response(output)
          exitcode = output.exitcode
          stderr = output.stderr

          if exitcode != 0
            raise FileTransporterFailed, "[#{self.class}] Upload failed " \
              "(exitcode: #{exitcode})\n#{stderr}"
          elsif stderr != '\r\n' && stderr != ''
            raise FileTransporterFailed, "[#{self.class}] Upload failed " \
              "(exitcode: 0), but stderr present\n#{stderr}"
          end

          logger.debug 'Parsing CSV Response'
          logger.debug output.stdout

          array = CSV.parse(output.stdout, headers: true).map(&:to_hash)
          array.each { |h| h.each { |key, value| h[key] = nil if value == '' } }
          Hash[array.map { |entry| [entry.fetch('src_sha1'), entry] }]
        end

        # Converts a Ruby hash into a PowerShell hash table, represented in a
        # String.
        #
        # @param obj [Object] source Hash or object when used in recursive
        #   calls
        # @param depth [Integer] padding depth, used in recursive calls
        #   (default: `0`)
        # @return [String] a PowerShell hash table
        # @api private
        def ps_hash(obj, depth = 0)
          if obj.is_a?(Hash)
            obj.map do |k, v|
              %(#{pad(depth + 2)}#{ps_hash(k)} = #{ps_hash(v, depth + 2)})
            end.join(";\n").insert(0, "@{\n").insert(-1, "\n#{pad(depth)}}")
          else
            %("#{obj}")
          end
        end

        # Uploads an IO stream to a Base64-encoded destination file.
        #
        # **Implementation Note:** Some of the code in this method may appear
        # slightly too dense and while adding additional variables would help,
        # the code is written very precisely to avoid unwanted allocations
        # which will bloat the Ruby VM's object space (and memory footprint).
        # The goal here is to stream potentially large files to a remote host
        # while not loading the entire file into memory first, then Base64
        # encoding it--duplicating the file in memory again.
        #
        # @param input_io [#read] a readable stream or object to be uploaded
        # @param dest [String] path to the destination file on the remote host
        # @return [Integer,Integer] the number of resulting upload chunks and
        #   the number of bytes transferred to the remote host
        # @api private
        def stream_upload(input_io, dest)
          read_size = ((max_encoded_write - dest.length) / 4) * 3
          chunk = 1
          bytes = 0
          # Do not freeze this string
          buffer = ''
          shell.run(<<-PS
            $to = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("#{dest}")
            $parent = Split-Path $to
            if(!(Test-path $parent)) { mkdir $parent | Out-Null }
            $fileStream = New-Object -TypeName System.IO.FileStream -ArgumentList @(
                $to,
                [system.io.filemode]::Create,
                [System.io.FileAccess]::Write,
                [System.IO.FileShare]::ReadWrite
            )
            # Powershell caches ScrpitBlocks in a dictionary
            # keyed on the script block text. Thats just great
            # unless the script is super large and called a gillion
            # times like we might do. In such a case it will saturate the
            # Large Object Heap and lead to Out Of Memory exceptions
            # for large files or folders. So we call the internal method
            # ClearScriptBlockCache to clear it.
            $bindingFlags= [Reflection.BindingFlags] "NonPublic,Static"
            $method = [scriptblock].GetMethod("ClearScriptBlockCache", $bindingFlags)
          PS
                   )

          while input_io.read(read_size, buffer)
            bytes += (buffer.bytesize / 3 * 4)
            shell.run(stream_command([buffer].pack(BASE64_PACK)))
            logger.debug "Wrote chunk #{chunk} for #{dest}" if chunk % 25 == 0
            chunk += 1
            yield bytes if block_given?
          end
          shell.run('$fileStream.Dispose()')
          buffer = nil # rubocop:disable Lint/UselessAssignment

          [chunk - 1, bytes]
        end

        def stream_command(encoded_bytes)
          <<-PS
            if($method) { $method.Invoke($Null, $Null) }
            $bytes=[Convert]::FromBase64String('#{encoded_bytes}')
            $fileStream.Write($bytes, 0, $bytes.length)
          PS
        end

        # Uploads a local file.
        #
        # @param src [String, StringIO] path to a local file or StringIO object
        # @param dest [String] path to the file on the remote host
        # @return [Integer,Integer] the number of resulting upload chunks and
        #   the number of bytes transferred to the remote host
        # @api private
        def stream_upload_file(src, dest, &block)
          logger.debug "Uploading #{src} to #{dest}"
          chunks = 0
          bytes = 0
          elapsed = Benchmark.measure do
            if src.is_a?(StringIO)
              chunks, bytes = stream_upload(src, dest, &block)
            else
              File.open(src, 'rb') do |io|
                chunks, bytes = stream_upload(io, dest, &block)
              end
            end
          end
          logger.debug(
            "Finished uploading #{src} to #{dest} " \
            "(#{bytes.to_f / 1000} KB over #{chunks} chunks) " \
            "in #{duration(elapsed.real)}"
          )

          [chunks, bytes]
        end

        # Uploads a collection of "dirty" files to the remote host as
        # Base64-encoded temporary files. A "dirty" file is one which has the
        # `"chk_dirty"` option set to `"True"` in the incoming files Hash.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [Hash] a report hash, keyed by the local SHA1 digest
        # @api private
        def stream_upload_files(files)
          response = {}
          files.each do |sha1, data|
            src = data.fetch('src_zip', data['src'])
            if data['chk_dirty'] == 'True'
              response[sha1] = { 'dest' => data['tmpzip'] || data['dst'] }
              chunks, bytes = stream_upload_file(src, data['tmpzip'] || data['dst']) do |xfered|
                yield data['src'], xfered
              end
              response[sha1]['chunks'] = chunks
              response[sha1]['xfered'] = bytes
            else
              logger.debug "File #{data['dst']} is up to date, skipping"
            end
          end
          response
        end

        # Total by byte count to be transferred.
        # Calculates count based on the sum of base64 encoded content size
        # of all files base 64 that are dirty.
        #
        # @param files [Hash] files hash, keyed by the local SHA1 digest
        # @return [Fixnum] total byte size
        # @api private
        def total_base64_transfer_size(files)
          size = 0
          files.values.each { |file| size += file['size'] if file['chk_dirty'] == 'True' }
          size / 3 * 4
        end
      end
      # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/ClassLength
    end
  end
end
