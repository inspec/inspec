module Inspec::Fetcher
  class Gem < Inspec.fetcher(1)
    name "gem"
    priority 0.5 # TODO: verify value
    # Priority is used for setting precedence of fetchers. And registry plugin(v1) decides which fetcher to use for loading profiles by using this priority
    # Gem fetcher's priority should be lowest because gem profiles are only executables via inspec metadata

    def self.resolve(target)
      if target.is_a?(Hash) && target.key?(:gem)
        resolve_from_hash(target)
      end
    end

    def self.resolve_from_hash(target)
      return unless target.key?(:gem)

      # TODO: implement version
      # TODO: implement source
      new(target)
    end

    def initialize(target, opts = {})
      @target = target
      @backend = opts[:backend]
      @archive_shasum = nil
    end

    def fetch(path)
      # TODO Logic to perform the installation

      @target
    end

    def archive_path
      @target
    end

    def writable?
      # Gem based profile is not writable because it is not cached in lockfile
      false
    end

    def cache_key
      # Want this to be any unstable value - always changing for now
      rand().to_s
    end

    def sha256
      # TODO - calculate the sha of the installed rubygem
      cache_key # WRONG
      # Left as an exercise
      # if !@archive_shasum.nil?
      #   @archive_shasum
      # elsif File.directory?(@target)
      #   nil
      # else
      #   perform_shasum(@target)
      # end
    end

    # def perform_shasum(target)
    #   return @archive_shasum if @archive_shasum
    #   raise(Inspec::FetcherFailure, "Profile dependency local path '#{target}' does not exist") unless File.exist?(target)

    #   @archive_shasum = OpenSSL::Digest.digest("SHA256", File.read(target)).unpack("H*")[0]
    # end

    def resolved_source
      h = { path: @target }
      h[:sha256] = sha256 if sha256
      h
    end
  end
end
