module Semverse
  class Constraint
    class << self
      # Coerce the object into a constraint.
      #
      # @param [Constraint, String]
      #
      # @return [Constraint]
      def coerce(object)
        if object.nil?
          DEFAULT_CONSTRAINT
        else
          object.is_a?(self) ? object : new(object)
        end
      end

      # Returns all of the versions which satisfy all of the given constraints
      #
      # @param [Array<Semverse::Constraint>, Array<String>] constraints
      # @param [Array<Semverse::Version>, Array<String>] versions
      #
      # @return [Array<Semverse::Version>]
      def satisfy_all(constraints, versions)
        constraints = Array(constraints).collect do |con|
          con.is_a?(Constraint) ? con : Constraint.new(con)
        end.uniq

        versions = Array(versions).collect do |ver|
          ver.is_a?(Version) ? ver : Version.new(ver)
        end.uniq

        versions.select do |ver|
          constraints.all? { |constraint| constraint.satisfies?(ver) }
        end
      end

      # Return the best version from the given list of versions for the given list of constraints
      #
      # @param [Array<Semverse::Constraint>, Array<String>] constraints
      # @param [Array<Semverse::Version>, Array<String>] versions
      #
      # @raise [NoSolutionError] if version matches the given constraints
      #
      # @return [Semverse::Version]
      def satisfy_best(constraints, versions)
        solution = satisfy_all(constraints, versions)

        if solution.empty?
          raise NoSolutionError
        end

        solution.sort.last
      end

      # Split a constraint string into an Array of two elements. The first
      # element being the operator and second being the version string.
      #
      # If the given string does not contain a constraint operator then (=)
      # will be used.
      #
      # If the given string does not contain a valid version string then
      # nil will be returned.
      #
      # @param [#to_s] constraint
      #
      # @example splitting a string with a constraint operator and valid version string
      #   Constraint.split(">= 1.0.0") => [ ">=", "1.0.0" ]
      #
      # @example splitting a string without a constraint operator
      #   Constraint.split("0.0.0") => [ "=", "1.0.0" ]
      #
      # @example splitting a string without a valid version string
      #   Constraint.split("hello") => nil
      #
      # @return [Array, nil]
      def split(constraint)
        data = REGEX.match(constraint)

        if data.nil?
          raise InvalidConstraintFormat.new(constraint)
        else
          [
            data[:operator] || DEFAULT_OPERATOR,
            data[:major].to_i,
            data[:minor] && data[:minor].to_i,
            data[:patch] && data[:patch].to_i,
            data[:pre_release],
            data[:build],
          ]
        end
      end

      # @param [Semverse::Constraint] constraint
      # @param [Semverse::Version] target_version
      #
      # @return [Boolean]
      def compare_approx(constraint, target_version)
        min = constraint.version
        max = if constraint.patch.nil?
          Version.new([min.major + 1, 0, 0, 0])
        elsif constraint.build
          identifiers = constraint.version.identifiers(:build)
          replace     = identifiers.last.to_i.to_s == identifiers.last.to_s ? "-" : nil
          Version.new([min.major, min.minor, min.patch, min.pre_release, identifiers.fill(replace, -1).join('.')])
        elsif constraint.pre_release
          identifiers = constraint.version.identifiers(:pre_release)
          replace     = identifiers.last.to_i.to_s == identifiers.last.to_s ? "-" : nil
          Version.new([min.major, min.minor, min.patch, identifiers.fill(replace, -1).join('.')])
        else
          Version.new([min.major, min.minor + 1, 0, 0])
        end
        min <= target_version && target_version < max
      end
    end

    # The default constraint string.
    #
    # @return [String]
    DEFAULT_OPERATOR = '='.freeze

    # The complete list of possible operators, paired with a proc to be used for
    # evaluation.
    #
    # @example
    #   OPERATORS['='].call(constraint, version)
    #
    # @return [Hash<String, Proc>]
    OPERATORS = { #:nodoc:
      '='  => ->(c, v) { v == c.version },
      '!=' => ->(c, v) { v != c.version },
      '>'  => ->(c, v) { v >  c.version },
      '<'  => ->(c, v) { v <  c.version },
      '>=' => ->(c, v) { v >= c.version },
      '<=' => ->(c, v) { v <= c.version },
      '~'  => method(:compare_approx),
      '~>' => method(:compare_approx),
    }.freeze

    # This is a magical regular expression that matches the Semantic versioning
    # specification found at http://semver.org. In addition to supporting all
    # the possible versions, it also provides a named +match_data+ which makes
    # it really delightful to work with.
    #
    # @return [Regexp]
    REGEX = /\A
      ((?<operator>(#{OPERATORS.keys.join('|')}))[[:space:]]*)?
      (?<major>\d+)
      (\.(?<minor>\d+))?
      (\.(?<patch>\d+))?
      (\-(?<pre_release>[0-9A-Za-z\-\.]+))?
      (\+(?<build>[0-9A-Za-z\-\.]+))?
    \z/x.freeze

    attr_reader :operator
    attr_reader :major
    attr_reader :minor
    attr_reader :patch
    attr_reader :pre_release
    attr_reader :build

    # Return the Semverse::Version representation of the major, minor, and patch
    # attributes of this instance
    #
    # @return [Semverse::Version]
    attr_reader :version

    # @param [#to_s] constraint
    def initialize(constraint = '>= 0.0.0')
      constraint = constraint.to_s
      if constraint.nil? || constraint.empty?
        constraint = ">= 0.0.0"
      end
      @operator, @major, @minor, @patch, @pre_release, @build = self.class.split(constraint)

      unless ['~>', '~'].include?(@operator)
        @minor ||= 0
        @patch ||= 0
      end

      @version = Version.new([
        self.major,
        self.minor,
        self.patch,
        self.pre_release,
        self.build,
      ])
    end

    # Returns true or false if the given version would be satisfied by
    # the version constraint.
    #
    # @param [Version, #to_s] target
    #
    # @return [Boolean]
    def satisfies?(target)
      target = Version.coerce(target)

      if !version.zero? && greedy_match?(target)
        return false
      end

      OPERATORS[operator].call(self, target)
    end

    # dep-selector uses include? to determine if a version matches the
    # constriant.
    alias_method :include?, :satisfies?

    # @param [Object] other
    #
    # @return [Boolean]
    def ==(other)
      other.is_a?(self.class) &&
        self.operator == other.operator &&
        self.version == other.version
    end
    alias_method :eql?, :==

    # The detailed string representation of this constraint.
    #
    # @return [String]
    def inspect
      "#<#{self.class.to_s} #{to_s}>"
    end

    # The string representation of this constraint.
    #
    # @return [String]
    def to_s
      out =  "#{operator} #{major}"
      out << ".#{minor}" if minor
      out << ".#{patch}" if patch
      out << "-#{pre_release}" if pre_release
      out << "+#{build}" if build
      out
    end

    private

      # Returns true if the given version is a pre-release and if the constraint
      # does not include a pre-release and if the operator isn't < or <=.
      # This avoids greedy matches, e.g. 2.0.0.alpha won't satisfy >= 1.0.0.
      #
      # @param [Semverse::Version] target_version
      #
      def greedy_match?(target_version)
        !['<', '<='].include?(self.operator) &&
        target_version.pre_release? &&
        !version.pre_release?
      end
  end
end
