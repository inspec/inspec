require "inspec/profile"
require "inspec/config"

module Inspec
  class ProfileVendor
    attr_reader :profile_path

    def initialize(path)
      @profile_path = Pathname.new(File.expand_path(path))
    end

    def vendor!(opts)
      vendor_dependencies!(opts)
    end

    # The URL fetcher uses a Tempfile to retrieve the vendored
    # profile, which creates a file that is only readable by
    # the current user. In most circumstances, this is likely OK.
    # However, in environments like a Habitat package, these files
    # need to be readable by all users or the Habitat Supervisor
    # may not be able to start InSpec correctly.
    #
    # This method makes sure all vendored files are mode 644 for this
    # use case. This method is not called by default - the caller
    # vendoring the profile must make the decision as to whether this
    # is necessary.
    def make_readable
      Dir.glob("#{cache_path}/**/*") do |e|
        FileUtils.chmod(0644, e) if File.file?(e)
      end
    end

    def cache_path
      profile_path.join("vendor")
    end

    def lockfile
      profile_path.join("inspec.lock")
    end

    private

    def profile
      @profile ||= Inspec::Profile.for_target(profile_path.to_s, profile_opts)
    end

    def profile_opts
      {
        vendor_cache: Inspec::Cache.new(cache_path.to_s),
        backend: Inspec::Backend.create(Inspec::Config.mock),
      }
    end

    def vendor_dependencies!(opts)
      # This deletes any existing vendor/ directory
      delete_vendored_data
      warm_vendor_cache_from_archives if opts[:airgap]
      File.write(lockfile, profile.generate_lockfile.to_yaml)
      extract_archives
    end

    def delete_vendored_data
      FileUtils.rm_rf(cache_path) if cache_path.exist?
      File.delete(lockfile) if lockfile.exist?
    end

    def extract_archives
      Dir.glob(File.join(cache_path, "*")).each do |filepath|
        # Get SHA without extension
        # We use split since '.' is not valid in a SHA checksum
        destination_dir_name = File.basename(filepath).split(".")[0]
        destination_path = File.join(cache_path, destination_dir_name)

        provider = FileProvider.for_path(filepath)

        next unless provider.is_a?(ZipProvider) || provider.is_a?(TarProvider)

        Inspec::Log.debug("Extracting '#{filepath}' to '#{destination_path}'")
        provider.extract(destination_path)

        Inspec::Log.debug("Deleting archive '#{filepath}'")
        File.delete(filepath)
      end
    end

    # Check top-level profile metadata for any local archives
    # if present, go ahead and inflate it into the vendor cache.
    # This will cause subsequent fetchers to hit on the vendor cache,
    # avoiding a possibly failing fetch under airgapped conditions.
    def warm_vendor_cache_from_archives
      # We need to determine the cwd of the profile, to expand the (likely)
      # relative path of the dependencies. There is no non-invasive way of doing that.
      profile_cwd = profile.source_reader.target.parent.path

      # list dependencies in profile
      profile.metadata.dependencies.each do |dep_info|
        next unless dep_info.key?(:path) # "Local"-type fetchers are identified by the :path key

        # Locate local dep
        dep_profile_path = File.expand_path(dep_info[:path], profile_cwd)
        raise(Inspec::FetcherFailure, "Profile dependency local path '#{dep_profile_path}' does not exist") unless File.exist?(dep_profile_path)

        # Determine if it is an archive
        file_provider = FileProvider.for_path(dep_profile_path)
        next unless file_provider.is_a?(ZipProvider) || file_provider.is_a?(TarProvider)

        # Place the local dependency in the vendor cache.
        # Fetchers are in charge of calculating cache keys.
        fetcher = Inspec::Fetcher::Local.resolve(dep_profile_path)
        # Use a shorter name here in hopes of dodging windows filesystems path length restrictions
        actual_dep_profile_cache_dir = "#{cache_path}/#{fetcher.cache_key}"
        short_dep_profile_cache_dir = "#{cache_path}/short"
        file_provider.extract(short_dep_profile_cache_dir)

        # The archive (probably) contained a vendor cache of its own.
        # Since we are warming the fetcher cache, and fetcher caches are one-level
        # while archive caches are potentially deep, we must flatten the archive cache,
        # so that all vendor cache entries are top-level.
        Dir["#{short_dep_profile_cache_dir}/vendor/*"].each do |sub_dep_cache_dir|
          FileUtils.mv(sub_dep_cache_dir, cache_path)
        end

        # And finally correctly name the dependency itself.
        FileUtils.mv(short_dep_profile_cache_dir, actual_dep_profile_cache_dir)

      end
    end
  end
end
