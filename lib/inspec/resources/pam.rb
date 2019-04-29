# Pluggalbe Authentication Modules (PAM) resources and matchers for InSpec
#
# copyright: 2019, Onyx Point, Inc.
# @author Trevor Vaughan <tvaughan@onyxpoint.com>
module Inspec::Resources
  class Pam < Inspec.resource(1)
    # These are aliases for one another
    attr_reader :rules, :lines

    # These are here for useful interfaces into the module stack based on
    # common searches
    attr_reader :services, :types, :modules

    name 'pam'

    supports platform: 'unix'

    desc 'Use the InSpec Pluggable Authentication Modules (PAM) resource to test the given system PAM configuration'
    example "
      # Query for a match:

      describe pam('/etc/pam.d/system-auth') do
        its('rules') { should match_pam_rule('password sufficient pam_unix.so sha512') }
      end

      # Query everything for a match without specific arguments
      # You can use a Ruby regexp match for everything except arguments

      describe pam('/etc/pam.d') do
        its('rules') { should match_pam_rule('.* .* pam_unix.so').all_without_args('nullok') }
      end

      # Query for multiple lines

      describe pam('/etc/pam.d/password-auth') do
        required_rules = [
          'auth required pam_faillock.so',
          'auth sufficient pam_unix.so try_first_pass'
        ]
        its('rules') { should match_pam_rules(required_rules) }
      end

      # Query for multiple rules without any rules in between them

      describe pam('/etc/pam.d/password-auth') do
        required_rules = [
          'auth required pam_faillock.so',
          'auth sufficient pam_unix.so try_first_pass'
        ]
        its('rules') { should match_pam_rules(required_rules).exactly }
      end
    "

    # Ensure that users know that errors are coming from the PAM resource
    class PamError < StandardError; end

    # Create a new PAM resource
    #
    # @param [String] path
    #   Path to the target PAM configuration file or directory
    def initialize(path = '/etc/pam.d')
      # To know what we were actually derived from
      @path           = path

      # Easy access helpers
      @services       = {}
      @types          = {}
      @modules        = {}

      pam_config_file = get_file(path)

      @rules          = Pam::Rules.new(pam_config_file)
      @lines          = @rules

      @top_config     = false

      if path.strip == '/etc/pam.conf'
        @top_config = true
      end

      parse_content(pam_config_file)
    end

    # Process a PAM configuration file
    #
    # @param [String] path
    #   Path to the file or directory to process
    # @param [String] service_name
    #   The PAM Service under which the content falls
    #   Mainly used for recursive processing
    def parse_content(path, service_name = nil)
      config_files = Array(path)

      if path.directory?
        config_files = list_files("#{path}/*")
      end

      config_files.each do |config_file|
        next unless config_file.content

        # Support multi-line continuance and skip all comments and blank lines
        rules = config_file.content.gsub("\\\n",' ').lines.map(&:strip).delete_if do |line|
          line  =~ /^(\s*#.*|\s*)$/
        end

        service = service_name
        unless service || @top_config
          service = config_file.basename
        end

        rules.each do |rule|
          new_rule = Pam::Rule.new(rule, {:service_name => service})

          # If we hit an 'include' or 'substack' statement, we need to derail and
          # delve down that tail until we hit the end
          #
          # There's no recursion checking here but, if you have a recursive PAM
          # stack, you're probably not logging into your system anyway
          if ['include','substack'].include?(new_rule.control)
            # Support full path specification includes
            if new_rule.module_path[0].chr == '/'
              pam_sub_config_file = get_file(new_rule.module_path)
            else
              if File.directory?(path.path)
                pam_sub_config_file = get_file(File.join(path.path, new_rule.module_path))
              else
                pam_sub_config_file = get_file(File.join(File.dirname(path.path), new_rule.module_path))
              end
            end

            if pam_sub_config_file.exist?
              parse_content(pam_sub_config_file, service)
            end
          else

            unless new_rule.type && new_rule.control && new_rule.module_path
              raise PamError, "Invalid PAM config found at #{config_file}"
            end

            @services[new_rule.service] ||= []
            @services[new_rule.service] << new_rule

            @types[new_rule.type] ||= []
            @types[new_rule.type] << new_rule

            @modules[new_rule.module_path] ||= []
            @modules[new_rule.module_path] << new_rule

            @rules.push(new_rule)
          end
        end
      end
    end

    def to_s
      "PAM Config[#{@path}]"
    end

    def service(service_name)
      @services[service_name]
    end

    def type(type_name)
      @types[type_name]
    end

    def module(module_name)
      @modules[module_name]
    end

    private

    # These are primarily down here to assist with unit test stubbing since I
    # could not figure out how to stub the `inspec` object.

    # Get a list of File resources on the remote system
    def list_files(path)
      inspec.bash("ls #{path}").stdout.lines.map{|f| inspec.file(f.strip) }
    end

    # Get a specific File resource from the remote system
    def get_file(path)
      inspec.file(path)
    end

    # The list of rules with a bunch of helpers for matching in the future
    #
    # We do fuzzy matching across the board when checking for internal rule
    # matches
    class Rules < Array
      def initialize(pam_config_file)
        @pam_config_file = pam_config_file
      end

      def services
        self.collect{|l| l.service}.sort.uniq
      end

      def service
        svcs = self.collect{|l| l.service}.sort.uniq
        if svcs.length > 1
          raise PamError, %(More than one service found: '[#{svcs.join("', '")}]')
        end

        svcs.first
      end

      def first?(rule, opts={:service_name => nil})
        raise PamError, 'opts must be a hash' unless opts.is_a?(Hash)

        service_name = get_service_name(opts[:service_name])

        _rule = Pam::Rule.new(rule, {:service_name => service_name})

        rules_of_type(_rule.type, opts).first == _rule
      end

      def last?(rule, opts={:service_name => nil})
        raise PamError, 'opts must be a hash' unless opts.is_a?(Hash)

        service_name = get_service_name(opts[:service_name])

        _rule = Pam::Rule.new(rule, {:service_name => service_name})

        rules_of_type(_rule.type, opts).last == _rule
      end

      def rules_of_type(rule_type, opts={:service_name => nil})
        raise PamError, 'opts must be a hash' unless opts.is_a?(Hash)

        service_name = get_service_name(opts[:service_name])

        if @services[service_name]
          @services[service_name].find_all { |l| l.type == rule_type }
        else
          []
        end
      end

      # Determines if one or more rules are contained in the rule set
      #
      # @param [Array[String] rules The Rules to find
      # @param [Hash] opts Options for the include processor
      # @option opts [Boolean] :exact
      #   If set, no rules may be present between the rules provided in `rules`
      #   If unset, the rules simply need to be in the correct order, other rules
      #   may appear between them
      # @option opts [String] :service_name The PAM Service under which the rules
      #   should be searched
      # @return [Boolean] true if found, false otherwise
      def include?(rules, opts={:exact => false, :service_name => nil})
        raise PamError, 'opts must be a hash' unless opts.is_a?(Hash)

        service_name = get_service_name(opts[:service_name])

        rules = Array(rules).map{|l| Pam::Rule.new(l, {:service_name => service_name})}

        retval = false

        if opts[:exact]
          # This requires everything between the first and last rule to match
          # exactly

          first_entry = index(rules.first)
          last_entry = index(rules.last)

          if first_entry && last_entry
            retval = (self[first_entry..last_entry] == rules)
          end
        else
          # This match allows other rules between the two in question
          retval = (rules.select{|l| super(l)} == rules)
        end

        return retval
      end
      alias_method :match, :include?

      # An alias for setting `:exact => true` in the `include` method
      def include_exactly?(rules, opts={})
        include?(rules, opts.merge({:exact => true}))
      end
      alias_method :match_exactly, :include_exactly?

      # Convert the data structure to an Array suitable for an RSpec diff
      #
      # @return [Array[String]]
      def to_a
        self.sort_by{|l| l.type}.map{|l| l.to_s}
      end

      # Convert the data structure to a String
      #
      # @return [String]
      def to_s
        to_a.join("\n")
      end

      private

      # Get the service name out of the configuration target
      #
      # @param [String] svc_name Optional name of the service that should be
      #    returned
      #
      # @return String
      def get_service_name(svc_name = nil)
        return svc_name if svc_name

        if !svc_name && @pam_config_file.directory?
          raise PamError, 'You must pass ":service_name" as an option!'
        else
          return @pam_config_file.basename
        end
      end
    end

    # A single Rule object that has been processed
    #
    # Rule equality is a fuzzy match that can accept regular expression matches
    # within the string to compare
    class Rule
      attr_reader :to_s
      attr_reader :service, :silent, :type, :control, :module_path, :module_arguments

      def initialize(rule, opts = {})
        @to_s = rule.strip.gsub(/\s+/,' ')

        rule_regex = %r%
          ^                                                        # Start of Rule
          \s*                                                      # Ignore initial Whitespace
          (?<silent>-)?                                            # Capture Silent Flag
          #{'(?<service_name>.+?)\s+' unless opts[:service_name] } # Capture Service
          (?<type>.+?)\s+                                          # Capture Type
          (?<control>(\[.+\]|.+?))\s+                              # Capture Control
          (?<module_path>.+?(\.so)?)                               # Capture Module Path
          (\s+(?<module_args>.+?))?                                # Capture Module Args
          $                                                        # End of Rule
        %x

        match_data = rule.match(Regexp.new(rule_regex, Regexp::EXTENDED))

        unless match_data
          raise PamError, "Invalid PAM configuration rule: '#{rule}'"
        end

        @service          = opts[:service_name] ? opts[:service_name] : match_data[:service_name]
        @silent           = match_data[:silent] == '-'
        @type             = match_data[:type]
        @control          = match_data[:control]
        @module_path      = match_data[:module_path]
        @module_arguments = match_data[:module_args] ? match_data[:module_args].strip.split(/\s+/) : []
      end

      # Determine if a rule matches
      #
      # @param [String, Pam::Rule] to_cmd
      #   The PAM rule to compare against
      def match?(to_cmp)
        to_cmp = Pam::Rule.new(to_cmp, {:service_name => @service}) if to_cmp.is_a?(String)

        # The simple match first
        self.class == to_cmp.class &&
          @service.match(Regexp.new("^#{to_cmp.service}$")) &&
          @type.match(Regexp.new("^#{to_cmp.type}$")) &&

          # Add escape characters to the square brackets and pipe symbol in each
          # control line
          @control.match(Regexp.new("^#{to_cmp.control.gsub(/(\[|\])/, '\\\\\\1')}$")) &&
          @module_path.match(Regexp.new("^#{to_cmp.module_path}$")) &&
          (
            # Quick test to pass if to_cmp module_arguments are a subset
            (to_cmp.module_arguments - @module_arguments).empty? ||
              # All module_arguments in to_cmp should Regex match something
              to_cmp.module_arguments.all? do |arg|
                !@module_arguments.grep(Regexp.new("^#{arg}$")).empty?
              end
          )
      end
      alias_method :==, :match?
      alias_method :eql?, :==
    end

    # Custom Matchers
    #
    # TODO explain somewhere that :all_with_args, :all_without_args, :all_with_integer_arg
    # will cause match_pam_rule to return true when there are no potential matches
    RSpec::Matchers.define :match_pam_rule do |expected|
      def matching_integer_arg? (line)
        line.module_arguments.any? do |arg|
          key, value = arg.split('=')

          value && (@args[:key] == key) && value.match?(/^-?\d+$/) &&
            value.to_i.send(@args[:operator].to_sym, @args[:value])
        end
      end

      match do |actual|
        retval = case @args_type
        when :all_with_args, :all_without_args, :all_with_integer_arg
          true
        when :any_with_args, :any_with_integer_arg
          false
        else
          raise PamError, "Error: matcher '#{@args_type}' is not supported"
        end

        if [:all_with_integer_arg, :any_with_integer_arg].include? @args_type
          # Operator is the actual comparison operator such as '>', '<', and '>='
          unless Numeric.method_defined?(@args[:operator])
            raise PamError, "Error: Comparison operator '#{@args[:operator]}' is invalid."
          end
        end

        actual_munge = {}

        @expected = expected.to_s

        if @args_type
          catch :stop_searching do
            actual.services.each do |service|
              expected_line = Pam::Rule.new(expected, :service_name => service)

              potentials = actual.find_all { |line| line.match?(expected_line) }

              if potentials && !potentials.empty?
                actual_munge[service] ||= []
                actual_munge[service] += potentials.map(&:to_s)

                potentials.each do |potential|
                  case @args_type
                  when :all_without_args
                    retval = !potential.module_arguments.join(' ').match?(@args)
                    throw :stop_searching unless retval
                  when :all_with_args
                    retval = potential.module_arguments.join(' ').match?(@args)
                    throw :stop_searching unless retval
                  when :all_with_integer_arg
                    retval = matching_integer_arg? potential
                    throw :stop_searching unless retval
                  when :any_with_integer_arg
                    retval = matching_integer_arg? potential
                    throw :stop_searching if retval
                  when :any_with_args
                    retval = potential.module_arguments.join(' ').match?(@args)
                    throw :stop_searching if retval
                  end
                end
              end
            end
          end
        else
          retval = actual.include?(expected, {:service_name => actual.service})
        end

        if actual_munge.empty?
          @actual = actual.to_s
        elsif actual_munge.keys.length == 1
          @actual = actual_munge.values.flatten.join("\n")
        else
          @actual = actual_munge.map do |service, lines|
            lines.map do |line|
              %{#{service} #{line}}
            end
          end.flatten.join("\n")
        end

        retval
      end

      diffable

      # TODO make these an array of args so that we can actually chain them together
      chain :any_with_args do |args|
        @args_type = :any_with_args
        @args = args
      end

      chain :all_with_args do |args|
        @args_type = :all_with_args
        @args = args
      end

      chain :all_without_args do |args|
        @args_type = :all_without_args
        @args = args
      end

      chain :all_with_integer_arg do |key, op, value|
        @args_type = :all_with_integer_arg
        @args = {:key => key, :operator => op, :value => value}
      end

      chain :any_with_integer_arg do |key, op, value|
        @args_type = :any_with_integer_arg
        @args = {:key => key, :operator => op, :value => value}
      end

      description do
        res = "include #{expected}"
        res += case @args_type
        when :all_with_args
          ", all with args #{@args}"
        when :all_without_args
          ", all without args #{@args}"
        when :all_with_integer_arg
          ", all with arg #{@args[:key]} #{@args[:operator]} #{@args[:value]}"
        when :any_with_integer_arg
          ", any with arg #{@args[:key]} #{@args[:operator]} #{@args[:value]}"
        when :any_with_args
          ", any with args #{@args}"
        end

        res
      end
    end

    RSpec::Matchers.define :match_pam_rules do |expected|
      match do |actual|
        @expected = expected.to_s
        @actual = actual.to_s

        if @exactly && actual.respond_to?(:include_exactly?)
          actual.include_exactly?(expected)
        else
          actual.include?(expected)
        end
      end

      diffable

      chain :exactly do
        @exactly = true
      end

      description do
        res = "include #{expected}"
        res += ' exactly' unless @exactly.nil?
        res
      end
    end
    # End Custom Matchers
  end
end
