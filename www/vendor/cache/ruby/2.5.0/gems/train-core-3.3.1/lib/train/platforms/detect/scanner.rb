# encoding: utf-8

require_relative "helpers/os_common"

module Train::Platforms::Detect
  class Scanner
    include Train::Platforms::Detect::Helpers::OSCommon

    def initialize(backend)
      @backend = backend
      @platform = {}
      @family_hierarchy = []

      # detect cache variables
      @files = {}
      @uname = {}
      @lsb = {}
      @cache = {}
    end

    # Main detect method to scan all platforms for a match
    #
    # @return Train::Platform instance or error if none found
    def scan
      # start with the platform/families who have no families (the top levels)
      top = Train::Platforms.top_platforms
      top.each do |_name, plat|
        # we are doing a instance_eval here to make sure we have the proper
        # context with all the detect helper methods
        next unless instance_eval(&plat.detect)

        # if we have a match start looking at the children
        plat_result = scan_children(plat)
        next if plat_result.nil?

        # return platform to backend
        @family_hierarchy << plat.name
        return get_platform(plat_result)
      end

      raise Train::PlatformDetectionFailed, "Sorry, we are unable to detect your platform"
    end

    def scan_children(parent)
      parent.children.each do |plat, condition|
        next unless instance_eval(&plat.detect)

        if plat.class == Train::Platforms::Platform
          return plat if condition.empty? || check_condition(condition)
        elsif plat.class == Train::Platforms::Family
          plat = scan_family_children(plat)
          return plat unless plat.nil?
        end
      end

      nil
    end

    def scan_family_children(plat)
      child_result = scan_children(plat) unless plat.children.nil?
      return if child_result.nil?

      @family_hierarchy << plat.name
      child_result
    end

    def check_condition(condition)
      condition.each do |k, v|
        op, expected = v.strip.split(" ")
        op = "==" if op == "="
        return false if @platform[k].nil? || !instance_eval("'#{@platform[k]}' #{op} '#{expected}'")
      end

      true
    end

    def get_platform(plat)
      plat.backend = @backend
      plat.platform = @platform
      plat.add_platform_methods
      plat.family_hierarchy = @family_hierarchy
      plat
    end
  end
end
