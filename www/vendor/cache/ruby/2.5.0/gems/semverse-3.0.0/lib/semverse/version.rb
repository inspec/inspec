module Semverse
  class Version
    class << self
      # Coerce the object into a version.
      #
      # @param [Version, String]
      #
      # @return [Version]
      def coerce(object)
        object.is_a?(self) ? object : new(object)
      end

      # @param [#to_s] version_string
      #
      # @raise [InvalidVersionFormat]
      #
      # @return [Array]
      def split(version_string)
        case version_string.to_s
        when /^(\d+)\.(\d+)\.(\d+)(-([0-9a-z\-\.]+))?(\+([0-9a-z\-\.]+))?$/i
          [ $1.to_i, $2.to_i, $3.to_i, $5, $7 ]
        when /^(\d+)\.(\d+)\.(\d+)?$/
          [ $1.to_i, $2.to_i, $3.to_i ]
        when /^(\d+)\.(\d+)?$/
          [ $1.to_i, $2.to_i, 0 ]
        when /^(\d+)$/
          [ $1.to_i, 0, 0 ]
        else
          raise InvalidVersionFormat.new(version_string)
        end
      end
    end

    include Comparable

    attr_reader :major
    attr_reader :minor
    attr_reader :patch
    attr_reader :pre_release
    attr_reader :build

    # @overload initialize(version_array)
    #   @param [Array] version_array
    #
    #   @example
    #     Version.new([1, 2, 3, 'rc.1', 'build.1']) => #<Version: @major=1, @minor=2, @patch=3, @pre_release='rc.1', @build='build.1'>
    #
    # @overload initialize(version_string)
    #   @param [#to_s] version_string
    #
    #   @example
    #     Version.new("1.2.3-rc.1+build.1") => #<Version: @major=1, @minor=2, @patch=3, @pre_release='rc.1', @build='build.1'>
    #
    # @overload initialize(version)
    #   @param [Semverse::Version] version
    #
    #   @example
    #     Version.new(Version.new("1.2.3-rc.1+build.1")) => #<Version: @major=1, @minor=2, @pre_release='rc.1', @build='build.1'>
    #
    def initialize(*args)
      if args.first.is_a?(Array)
        @major, @minor, @patch, @pre_release, @build = args.first
      else
        @major, @minor, @patch, @pre_release, @build = self.class.split(args.first.to_s)
      end

      @major       ||= 0
      @minor       ||= 0
      @patch       ||= 0
      @pre_release ||= nil
      @build       ||= nil
    end

    # @param [Semverse::Version] other
    #
    # @return [Integer]
    def <=>(other)
      [:major, :minor, :patch].each do |release|
        ans = self.send(release) <=> other.send(release)
        return ans if ans != 0
      end
      ans = pre_release_and_build_presence_score <=> other.pre_release_and_build_presence_score
      return ans if ans != 0
      ans = identifiers_comparaison(other, :pre_release)
      return ans if ans != 0
      if build && other.build
        return identifiers_comparaison(other, :build)
      else
        return build.to_s <=> other.build.to_s
      end
      0
    end

    # @return [Array]
    def identifiers(release)
      send(release).to_s.split('.').map do |str|
        str.to_i.to_s == str ? str.to_i : str
      end
    end

    def pre_release?
      !!pre_release
    end

    def zero?
      [major, minor, patch].all? { |n| n == 0 }
    end

    # @return [Integer]
    def pre_release_and_build_presence_score
      pre_release ? 0 : (build.nil? ? 1 : 2)
    end

    # @param [Semverse::Version] other
    #
    # @return [Integer]
    def identifiers_comparaison(other, release)
      [identifiers(release).length, other.identifiers(release).length].max.times do |i|
        if identifiers(release)[i].class == other.identifiers(release)[i].class
          ans = identifiers(release)[i] <=> other.identifiers(release)[i]
          return ans if ans != 0
        elsif identifiers(release)[i] && other.identifiers(release)[i]
          return identifiers(release)[i].class.to_s <=> other.identifiers(release)[i].class.to_s
        elsif identifiers(release)[i] || other.identifiers(release)[i]
          return other.identifiers(release)[i].class.to_s <=> identifiers(release)[i].class.to_s
        end
      end
      0
    end

    # @param [Semverse::Version] other
    #
    # @return [Boolean]
    def eql?(other)
      other.is_a?(Version) && self == other
    end

    def inspect
      "#<#{self.class.to_s} #{to_s}>"
    end

    def to_s
      str = "#{major}.#{minor}.#{patch}"
      str += "-#{pre_release}" if pre_release
      str += "+#{build}" if build
      str
    end
  end
end
