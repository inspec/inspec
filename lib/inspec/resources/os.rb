require "inspec/resources/platform"

module Inspec::Resources
  class OSResource < PlatformResource
    name "os"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the os InSpec audit resource to test the platform on which the system is running."
    example <<~EXAMPLE
      describe os[:family] do
        it { should eq 'redhat' }
      end

      describe os.redhat? do
        it { should eq true }
      end

      describe os.linux? do
        it { should eq true }
      end
    EXAMPLE

    # reuse helper methods from backend
    %w{aix? redhat? debian? suse? bsd? solaris? linux? unix? windows? hpux? darwin?}.each do |os_family|
      define_method(os_family.to_sym) do
        @platform.send(os_family)
      end
    end

    def resource_id
      platform_info[:name] || "OS"
    end

    def to_s
      "Operating System Detection"
    end

    def release
      platform_specific_info(@platform, "release") || platform_info[:release]
    end

    def version
      Version.new(release)
    end

    def params
      {
        name: platform_info[:name],
        families: platform_info[:families],
        release: platform_info[:release],
        arch: platform_info[:arch],
        version: {
          major: version.major,
          minor: version.minor,
          patch: version.patch,
          build: platform_specific_info(@platform, "build") || version.build,
        },
      }.tap { |h| h.delete(:arch) if in_family?("api") }
    end

    attr_reader :platform

    # rubocop:disable Style/Documentation
    class Version
      def initialize(version_string)
        @version = Gem::Version.new(version_string)
      end

      def major
        @version.segments[0]
      end

      def minor
        @version.segments[1]
      end

      def patch
        @version.segments[2]
      end

      def build
        @version.segments.size > 3 ? @version.segments[3..-1].join(".") : nil
      end

      def to_s
        @version.to_s
      end

      def <=>(other)
        other_version = convert_to_version(other)
        @version <=> other_version
      end

      def eql?(other)
        other_version = convert_to_version(other)
        @version.eql?(other_version)
      end

      def ==(other)
        other_version = convert_to_version(other)
        @version == other_version
      end

      def ===(other)
        other_version = convert_to_version(other)
        @version === other_version
      end

      def <=(other)
        other_version = convert_to_version(other)
        @version <= other_version
      end

      def >=(other)
        other_version = convert_to_version(other)
        @version >= other_version
      end

      def <(other)
        other_version = convert_to_version(other)
        @version < other_version
      end

      def >(other)
        other_version = convert_to_version(other)
        @version > other_version
      end

      private

      def convert_to_version(value)
        Gem::Version.new(value.to_s)
      end
    end

    private

    def platform_info
      {
        name: platform[:name],
        families: platform[:family_hierarchy],
        release: platform_specific_info(@platform, "release") || platform[:release],
        arch: platform[:arch],
      }
    end

    # NOTE: This generally should be a PR to train but this gives us some flexibility
    def platform_specific_info(platform, type)
      case platform.name
      when "mac_os_x", "darwin"  # Explicitly list supported platform names
        case type
        when "release"
          inspec.command("sw_vers -productVersion").stdout.strip
        when "build"
          inspec.command("sw_vers -buildVersion").stdout.strip
        end
      end
    end
  end
end
