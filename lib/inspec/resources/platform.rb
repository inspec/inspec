require 'inspec/resource'
require 'rubygems/version'
require 'logger'

module Inspec::Resources
  class PlatformResource < Inspec.resource(1)
    name 'platform'
    desc 'Use the platform InSpec resource to test the platform on which the system is running.'
    example <<~EXAMPLE
      describe platform do
        its('name') { should eq 'redhat' }
      end

      describe platform do
        it { should be_in_family('unix') }
      end
    EXAMPLE

    # rubocop:disable Style/Documentation
    class Version
      def initialize(version_string, build_version = nil)
        @version = Gem::Version.new(version_string)
        @build_version = build_version
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
        @build_version || (@version.segments.size > 3 ? @version.segments[3..-1].join('.') : nil)
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
        value = format('%.2f', value) if value.is_a? Numeric
        Gem::Version.new(value.to_s)
      end
    end

    def initialize
      @platform = inspec.backend.platform
    end

    attr_reader :platform

    def family
      platform.family
    end

    def release
      platform.release
    end

    def arch
      platform.arch
    end

    def families
      platform.family_hierarchy
    end

    def name
      platform.name
    end

    def [](key)
      key = key.to_sym if key.is_a?(String)
      return name if key == :name

      # For other keys, retrieve them directly from the Train platform object:
      case key
      when :family
        family
      when :release
        release
      when :arch
        arch
      when :family_hierarchy
        families
      end
    end

    def platform?(name)
      platform.name == name ||
        platform.family_hierarchy.include?(name)
    end

    def in_family?(family)
      platform.family_hierarchy.include?(family)
    end

    def version
      Version.new(release)
    end

    # rubocop:disable Style/HashSyntax
    def params
      {
        name: name,
        families: families,
        release: release,
        arch: arch,
        version: {
          major: version.major,
          minor: version.minor,
          patch: version.patch,
          build: version.build
        }
      }.tap { |h| h.delete(:arch) if in_family?('api') }
    end

    def supported?(supports)
      raise ArgumentError, '`supports` is nil.' unless supports

      # Handle string input by converting to array of platform hash
      supports = [{ platform: supports }] if supports.is_a?(String)

      supports.any? do |support|
        support.all? do |k, v|
          case normalize(k)
          when :os_family, :platform_family
            in_family?(v)
          when :os, :platform
            platform?(v)
          when :os_name, :platform_name
            check_name(v)
          when :release
            check_release(v)
          end
        end
      end || supports.empty?
    end

    # TODO: dumb... push this up or remove need
    def normalize(key)
      key.to_s.tr('-', '_').to_sym
    end

    def resource_id
      platform.name || 'platform'
    end

    def to_s
      'Platform Detection'
    end

    private

    def check_name(value)
      return false if name.nil?

      # allow wild card matching
      if value.include?('*')
        # Convert glob pattern to regex pattern
        pattern = value.gsub(/[.\-+]/) { |c| "\\#{c}" } # Escape special chars
                       .gsub(/\*/, '.*?') # Convert * to .*?
        # Create regex with case insensitive flag
        regex = Regexp.new("\\A#{pattern}\\z", Regexp::IGNORECASE)

        # Check against both name and platform.name
        [name, platform.name].compact.any? do |n|
          n =~ regex
        end
      else
        # Case-insensitive exact match
        name.casecmp?(value) || (platform.name && platform.name.casecmp?(value))
      end
    end

    def check_release(value)
      # allow wild card matching
      if value.include?('*')
        cleaned = Regexp.escape(value).gsub('\*', '.*?')
        release =~ /\A#{cleaned}\z/
      else
        release == value
      end
    end
  end
end
