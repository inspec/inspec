module Inspec::Fetcher
  class Gem < Inspec.fetcher(1)
    name "gem"
    priority 100 # TODO: verify value
    # Priority is used for setting precedence of fetchers. And registry plugin(v1) decides which fetcher to use for loading profiles by using this priority

    def self.resolve(target)
      if target.is_a?(Hash) && if target.key?(:gem)
        resolve_from_hash(target)
      end
    end

    def self.resolve_from_hash(target)
      return unless target.key?(:gem)

      # TODO: implement version
      # TODO: implement source
      require "byebug"; byebug
      new(target)
    end

    def initialize(target, opts = {})
      @target = target
      @backend = opts[:backend]
      @archive_shasum = nil
    end

  #   def fetch(path)
  #     # If `inspec exec` is used then we should not vendor/fetch. This makes
  #     # local development easier and more predictable.
  #     return @target if Inspec::BaseCLI.inspec_cli_command == :exec

  #     # Skip vendoring if @backend is not set (example: ad hoc runners)
  #     return @target unless @backend

  #     if File.directory?(@target)
  #       # Create an archive, checksum, and move to the vendor directory
  #       Dir.mktmpdir do |tmpdir|
  #         temp_archive = File.join(tmpdir, "#{File.basename(@target)}.tar.gz")
  #         opts = {
  #           backend: @backend,
  #           output: temp_archive,
  #         }

  #         # Create a temporary archive at `opts[:output]`
  #         Inspec::Profile.for_target(@target, opts).archive(opts)

  #         checksum = perform_shasum(temp_archive)
  #         final_path = File.join(path, checksum)
  #         FileUtils.mkdir_p(final_path)
  #         Inspec::FileProvider.for_path(temp_archive).extract(final_path)
  #       end
  #     else
  #       # Verify profile (archive) is valid and extract to vendor directory
  #       opts = { backend: @backend }
  #       Inspec::Profile.for_target(@target, opts).check
  #       Inspec::FileProvider.for_path(@target).extract(path)
  #     end

  #     @target
  #   end

  #   def archive_path
  #     @target
  #   end

  #   def writable?
  #     File.directory?(@target)
  #   end

    def cache_key
      # Want this to be any unstable value - always changing for now
      rand()
    end

    # def sha256
    #   if !@archive_shasum.nil?
    #     @archive_shasum
    #   elsif File.directory?(@target)
    #     nil
    #   else
    #     perform_shasum(@target)
    #   end
    # end

  #   def perform_shasum(target)
  #     return @archive_shasum if @archive_shasum
  #     raise(Inspec::FetcherFailure, "Profile dependency local path '#{target}' does not exist") unless File.exist?(target)

  #     @archive_shasum = OpenSSL::Digest.digest("SHA256", File.read(target)).unpack("H*")[0]
  #   end

  #   def resolved_source
  #     h = { path: @target }
  #     h[:sha256] = sha256 if sha256
  #     h
  #   end
    end
  end
end
