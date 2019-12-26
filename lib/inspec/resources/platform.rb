require "inspec/resource"

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
    end

    def family
      @platform.family
    end

    def release
      @platform.release
    end

    def arch
      @platform.arch if @platform.respond_to?(:arch)
    end

    def families
      @platform.family_hierarchy
    end

    def name
      @platform.name
    end

    def [](key)
      # convert string to symbol
      key = key.to_sym if key.is_a? String
      return name if key == :name

      @platform[key]
    end

    def platform?(name)
      @platform.name == name ||
        @platform.family_hierarchy.include?(name)
    end

    def in_family?(family)
      @platform.family_hierarchy.include?(family)
    end

    def params
      # rubocop:disable Layout/AlignHash
      h = {
        name:     name,
        families: families,
        release:  release,
        arch:     arch,
      }
      # rubocop:enable Layout/AlignHash

      h.delete :arch if in_family?("api") # not applicable if api

      h
    end

    def supported?(supports)
      return true if supports.nil? || supports.empty?

      status = true
      supports.each do |support|
        support.each do |k, v|
          status =
            case k
            when :os_family, :"os-family", :platform_family, :"platform-family" then
              in_family?(v)
            when :os, :platform then
              platform?(v)
            when :os_name, :"os-name", :platform_name, :"platform-name" then
              name == v
            when :release then
              check_release(v)
            else
              false
            end

          break if status == false
        end
        return true if status == true
      end

      status
    end

    def to_s
      "Platform Detection"
    end

    private

    def check_release(value)
      # allow wild card matching
      if value.include?("*")
        cleaned = Regexp.escape(value).gsub('\*', ".*?")
        !(release =~ /#{cleaned}/).nil?
      else
        release == value
      end
    end
  end
end
