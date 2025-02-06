require "inspec/resources/platform"
require "rubygems" unless defined?(Gem)  # This provides Gem::Version

module Inspec
  module Resources
    class OSResource < PlatformResource
      name "os"
      supports platform: "unix"
      supports platform: "windows"
      desc "Use the os InSpec audit resource to test the platform on which the system is running."
      example <<~EXAMPLE
        # Check OS family
        describe os[:family] do
          it { should eq 'redhat' }
        end

        # Helper methods for specific OS families
        describe os.redhat? do
          it { should eq true }
        end

        describe os.linux? do
          it { should eq true }
        end

        # Version comparisons, e.g., inspec standard `matchers`
        describe os.version do
          it { should cmp >= '8.10' }
        end

        # Accessing version components (via symbol)
        describe os.version(:major) do
          it { should eq '8' }
        end

        # Accessing version components (via dot accessors)
        describe os.version.minor do
          it { should cmp <= '10' }
        end

        # Accessing version components (via string)
        describe os.version('build') do
          it { should eq 1234 } # Or match against nil if no build
        end

        # Conditional checks based on version
        if os.version <= '3.10.2'
          describe file('/etc/old_config') do
            it { should exist }
          end
        end
      EXAMPLE

      # reuse helper methods from backend
      %w{aix? redhat? debian? suse? bsd? solaris? linux? unix? windows? hpux? darwin?}.each do |os_family|
        define_method(os_family.to_sym) do
          @platform.send(os_family)
        end
      end

      class VersionWrapper
        include Comparable

        def initialize(version_data)
          @version_data = version_data
        end

        def <=>(other)
          @version_data[:comparable_version] <=> (other.is_a?(Gem::Version) ? other : Gem::Version.new(other.to_s))
        end

        def eql?(other)
          return false unless other.is_a?(VersionWrapper)

          @version_data[:comparable_version].eql?(other.instance_variable_get(:@version_data)[:comparable_version])
        end

        def hash
          @version_data[:comparable_version].hash
        end

        def method_missing(method_name, *args)
          return super unless respond_to_missing?(method_name)

          @version_data[method_name]
        end

        def respond_to_missing?(method_name, include_private = false)
          %i{major minor patch build full}.include?(method_name) || super
        end

        # Updated to_s returns the original version string
        # without the build if present, preserving trailing zeros.
        def to_s
          if @version_data[:full].present?
            if @version_data[:build].present?
              # For OSes like macOS that include build info, return only the base version.
              @version_data[:full].split("+").first
            else
              # For OSes without a build, return the full string as-is.
              @version_data[:full]
            end
          else
            @version_data[:comparable_version].to_s
          end
        end

        def inspect
          "#<#{self.class} version=\"#{self}\" major=#{major} minor=#{minor} patch=#{patch} build=\"#{build}\">"
        end

        private

        def comparable_version
          @version_data[:comparable_version]
        end
      end

      def version(component = nil) # rubocop:disable Metrics/MethodLength
        @version_data ||= parse_version(normalized_version)

        return VersionWrapper.new(@version_data) if component.nil?

        # Convert string to symbol and ensure lowercase
        component = component.to_s.downcase.to_sym

        case component
        when :major, :minor, :patch, :build
          @version_data[component]
        when :full
          @version_data[:full]
        else
          raise Inspec::Exceptions::ResourceFailed, "Unknown version component: #{component}"
        end
      end

      def resource_id
        @platform.name || "OS"
      end

      def to_s
        "Operating System Detection"
      end

      private

      def parse_version(version_str)
        # Split version into base version and build number
        base_version, build = version_str.to_s.split("+", 2)

        # Parse the base version components
        major, minor, patch = base_version.strip.split(".", 3).map(&:to_i)

        # Create a clean version string for Gem::Version (without build)
        comparable_version = Gem::Version.new([major, minor, patch].compact.join("."))

        @version_data = {
          comparable_version: comparable_version, # rubocop:disable Style/HashSyntax
          major: major, # rubocop:disable Style/HashSyntax
          minor: minor, # rubocop:disable Style/HashSyntax
          patch: patch, # rubocop:disable Style/HashSyntax
          build: build, # rubocop:disable Style/HashSyntax
          full: version_str,
        }
      end

      def normalized_version
        case @platform.name
        when "darwin", "mac_os_x"
          product_version = inspec.command("sw_vers -productVersion").stdout.strip
          build_version = inspec.command("sw_vers -buildVersion").stdout.strip
          "#{product_version}+#{build_version}"
        when "windows"
          build = inspec.registry_key('HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion').value("CurrentBuild").to_s
          "#{@platform.release}+#{build}"
        else
          @platform.release
        end
      end
    end
  end
end
