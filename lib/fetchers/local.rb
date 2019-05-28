require 'openssl'

module Fetchers
  class Local < Inspec.fetcher(1)
    name 'local'
    priority 0

    def self.resolve(target)
      if target.is_a?(String)
        local_path = resolve_from_string(target)
        new(local_path) if local_path
      elsif target.is_a?(Hash)
        local_path = resolve_from_hash(target)
        new(local_path, target) if local_path
      end
    end

    def self.resolve_from_hash(target)
      return unless target.key?(:path)

      if target.key?(:cwd)
        File.expand_path(target[:path], target[:cwd])
      else
        target[:path]
      end
    end

    def self.resolve_from_string(target)
      # Support "urls" in the form of file://
      if target.start_with?('file://')
        target = target.gsub(%r{^file://}, '')
      else
        # support for windows paths
        target = target.tr('\\', '/')
      end

      target if File.exist?(File.expand_path(target))
    end

    def initialize(target, opts = {})
      @target = target
      @backend = opts[:backend]
      @archive_shasum = nil
    end

    def fetch(path)
      # If `inspec exec` is used then we should not vendor/fetch. This makes
      # local development easier and more predictable.
      return @target if Inspec::BaseCLI.inspec_cli_command == :exec

      # Skip vendoring if @backend is not set (example: ad hoc runners)
      return @target unless @backend

      if File.directory?(@target)
        # Create an archive, checksum, and move to the vendor directory
        Dir.mktmpdir do |tmpdir|
          temp_archive = File.join(tmpdir, "#{File.basename(@target)}.tar.gz")
          opts = {
            backend: @backend,
            output: temp_archive,
          }

          # Create a temporary archive at `opts[:output]`
          Inspec::Profile.for_target(@target, opts).archive(opts)

          checksum = perform_shasum(temp_archive)
          final_path = File.join(path, checksum)
          FileUtils.mkdir_p(final_path)
          Inspec::FileProvider.for_path(temp_archive).extract(final_path)
        end
      else
        # Verify profile (archive) is valid and extract to vendor directory
        opts = { backend: @backend }
        Inspec::Profile.for_target(@target, opts).check
        Inspec::FileProvider.for_path(@target).extract(path)
      end

      @target
    end

    def archive_path
      @target
    end

    def writable?
      File.directory?(@target)
    end

    def cache_key
      sha256.to_s
    end

    def sha256
      if !@archive_shasum.nil?
        @archive_shasum
      elsif File.directory?(@target)
        nil
      else
        perform_shasum(@target)
      end
    end

    def perform_shasum(target)
      @archive_shasum ||= OpenSSL::Digest::SHA256.digest(File.read(target)).unpack('H*')[0]
    end

    def resolved_source
      h = { path: @target }
      h[:sha256] = sha256 if sha256
      h
    end
  end
end
