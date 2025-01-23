require "inspec/resource"
require "rubygems/version"
require "logger"

module Inspec::Resources
  class PlatformResource < Inspec.resource(1)
    name "platform"
    desc "Use the platform InSpec resource to test the platform on which the system is running."
    example <<~EXAMPLE
      describe platform do
        its('name') { should eq 'redhat' }
      end

      describe platform do
        it { should be_in_family('unix') }
      end
    EXAMPLE

    def initialize
      @platform = inspec.backend.platform
      super
    end

    attr_reader :platform

    def family
      @platform.family
    end

    def release
      @platform.release
    end

    def arch
      @platform.arch
    end

    def families
      @platform.family_hierarchy
    end

    def name
      @platform.name
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
      @platform.name == name ||
        @platform.family_hierarchy.include?(name)
    end

    def in_family?(family)
      @platform.family_hierarchy.include?(family)
    end

    # rubocop:disable Style/HashSyntax
    def params
      {
        name: name,
        families: families,
        release: release,
        arch: arch,
      }.tap { |h| h.delete(:arch) if in_family?("api") }
    end

    def supported?(supports, recursive: false)
      return true if supports.nil? || supports.empty?

      # Handle string input by converting to array of platform hash
      supports = [{ platform: supports }] if supports.is_a?(String)

      supports.any? do |support|
        next false unless support.is_a?(Hash)

        support.all? do |k, v|
          key = normalize(k)
          case key
          when :os_family, :platform_family
            in_family?(v)
          when :os, :platform
            platform?(v)
          when :os_name, :platform_name
            check_name(v)
          when :release
            check_release(v)
          else
            false
          end
        end
      end
    end

    def normalize(key)
      key.to_s.tr("-", "_").to_sym
    end

    def resource_id
      platform.name || "platform"
    end

    def to_s
      "Platform Detection"
    end

    private

    def check_name(value)
      return false if name.nil?

      # allow wild card matching
      if value.include?("*")
        # Convert glob pattern to regex pattern
        pattern = value.gsub(/[.\-+]/) { |c| "\\#{c}" } # Escape special chars
          .gsub(/\*/, ".*?") # Convert * to .*?
        # Create regex with case insensitive flag
        regex = Regexp.new("\\A#{pattern}\\z", Regexp::IGNORECASE)

        # Check against both name and platform.name
        [name, @platform.name].compact.any? do |n|
          n =~ regex
        end
      else
        # Case-insensitive exact match
        name.casecmp?(value) || (@platform.name && @platform.name.casecmp?(value))
      end
    end

    def check_release(value)
      # allow wild card matching
      if value.include?("*")
        cleaned = Regexp.escape(value).gsub('\*', ".*?")
        release =~ /\A#{cleaned}\z/
      else
        release == value
      end
    end
  end
end
