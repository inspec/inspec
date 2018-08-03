# encoding: utf-8
# author: Adam Leff

require 'inspec/profile'

module Inspec
  class ProfileVendor
    attr_reader :profile_path

    def initialize(path)
      @profile_path = Pathname.new(path)
    end

    def vendor!
      vendor_dependencies
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
      profile_path.join('vendor')
    end

    def lockfile
      profile_path.join('inspec.lock')
    end

    private

    def profile
      @profile ||= Inspec::Profile.for_target(profile_path.to_s, profile_opts)
    end

    def profile_opts
      {
        vendor_cache: Inspec::Cache.new(cache_path.to_s),
        backend: Inspec::Backend.create(target: 'mock://'),
      }
    end

    def vendor_dependencies
      delete_vendored_data
      File.write(lockfile, profile.generate_lockfile.to_yaml)
      extract_archives
    end

    def delete_vendored_data
      FileUtils.rm_rf(cache_path) if cache_path.exist?
      File.delete(lockfile) if lockfile.exist?
    end

    def extract_archives
      Dir.glob(File.join(cache_path, '*')).each do |filepath|
        # Get SHA without extension
        # We use split since '.' is not valid in a SHA checksum
        destination_dir_name = File.basename(filepath).split('.')[0]
        destination_path = File.join(cache_path, destination_dir_name)

        file_provider = FileProvider.for_path(filepath)
        if file_provider.is_a?(ZipProvider) || file_provider.is_a?(TarProvider)
          Inspec::Log.debug("Extracting '#{filepath}' to '#{destination_path}'")
          file_provider.extract(destination_path)

          Inspec::Log.debug("Deleting archive '#{filepath}'")
          File.delete(filepath)
        else
          next
        end
      end
    end
  end
end
