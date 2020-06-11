require "logger"

module LicenseAcceptance
  class Config
    attr_accessor :output, :logger, :license_locations, :persist_location, :persist

    def initialize(opts = {})
      @output = opts.fetch(:output, $stdout)
      @logger = opts.fetch(:logger, ::Logger.new(IO::NULL))
      @license_locations = opts.fetch(:license_locations, default_license_locations)
      @license_locations = [ @license_locations ].flatten
      @persist_location = opts.fetch(:persist_location, default_persist_location)
      @persist = opts.fetch(:persist, true)
    end

    private

    def is_root?
      Process.uid == 0
    end

    def default_license_locations
      if windows?
        root = ENV.fetch("SYSTEMDRIVE", "C:")
        l = [ File.join(root, "chef/accepted_licenses/") ]
        unless is_root?
          # Look through a list of possible user locations and pick the first one that exists
          # copied from path_helper.rb in chef-config gem
          possible_dirs = []
          possible_dirs << ENV["HOME"] if ENV["HOME"]
          possible_dirs << ENV["HOMEDRIVE"] + ENV["HOMEPATH"] if ENV["HOMEDRIVE"] && ENV["HOMEPATH"]
          possible_dirs << ENV["HOMESHARE"] + ENV["HOMEPATH"] if ENV["HOMESHARE"] && ENV["HOMEPATH"]
          possible_dirs << ENV["USERPROFILE"] if ENV["USERPROFILE"]
          raise NoValidEnvironmentVar if possible_dirs.empty?

          possible_dirs.each do |possible_dir|
            if Dir.exist?(possible_dir)
              full_possible_dir = File.join(possible_dir, ".chef/accepted_licenses/")
              l << full_possible_dir
              break
            end
          end
        end
      else
        l = [ "/etc/chef/accepted_licenses/" ]
        l << File.join(ENV["HOME"], ".chef/accepted_licenses/") unless is_root?
      end
      l
    end

    def default_persist_location
      license_locations[-1]
    end

    def windows?
      !!(RUBY_PLATFORM =~ /(cygwin|mswin|mingw|bccwin|wince|emx)/i)
    end

  end

  class NoValidEnvironmentVar < StandardError
    def initialize
      super("no valid environment variables set on Windows")
    end
  end
end
