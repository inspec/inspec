
require 'inspec/utils/deprecation'

# For backwards compatibility during the rename (see #3802),
# maintain the Inspec::Attribute namespace for people checking for
# Inspec::Attribute::DEFAULT_ATTRIBUTE
module Inspec
  class Attribute
    # This only exists to create the Inspec::Attribute::DEFAULT_ATTRIBUTE symbol with a class
    class DEFAULT_ATTRIBUTE; end # rubocop: disable Style/ClassAndModuleCamelCase
  end
end

module Inspec
  class Input
    #===========================================================================#
    #                        Class Input::Event
    #===========================================================================#

    # Information about how the input obtained its value.
    # Each time it changes, an Input::Event is added to the #events array.
    class Event
      EVENT_PROPERTIES = [
        :action,   # :create, :set, :fetch
        :provider, # Name of the plugin
        :priority, # Priority of this plugin for resolving conflicts.  1-100, higher numbers win.
        :value,    # New value, if provided.
        :file,     # File containing the input-changing action, if known
        :line,     # Line in file containing the input-changing action, if known
        :hit,      # if action is :fetch, true if the remote source had the input
      ].freeze

      # Value has a special handler
      EVENT_PROPERTIES.reject { |p| p == :value }.each do |prop|
        attr_accessor prop
      end

      attr_reader :value

      def initialize(properties = {})
        @value_has_been_set = false

        properties.each do |prop_name, prop_value|
          if EVENT_PROPERTIES.include? prop_name
            # OK, save the property
            send((prop_name.to_s + '=').to_sym, prop_value)
          else
            raise "Unrecognized property to Input::Event: #{prop_name}"
          end
        end
      end

      def value=(the_val)
        # Even if set to nil or false, it has indeed been set; note that fact.
        @value_has_been_set = true
        @value = the_val
      end

      def value_has_been_set?
        @value_has_been_set
      end

      def diagnostic_string
        to_h.reject { |_, val| val.nil? }.to_a.map { |pair| "#{pair[0]}: '#{pair[1]}'" }.join(', ')
      end

      def to_h
        EVENT_PROPERTIES.each_with_object({}) do |prop, hash|
          hash[prop] = send(prop)
        end
      end

      def self.probe_stack
        frames = caller_locations(2, 40)
        frames.reject! { |f| f.path && f.path.include?('/lib/inspec/') }
        frames.first
      end
    end

    #===========================================================================#
    #                    Class NO_VALUE_SET
    #===========================================================================#
    # This special class is used to represent the value when an input has
    # not been assigned a value. This allows a user to explicitly assign nil
    # to an input.
    class NO_VALUE_SET # rubocop: disable Style/ClassAndModuleCamelCase
      def initialize(name)
        @name = name

        # output warn message if we are in a exec call
        Inspec::Log.warn(
          "Input '#{@name}' does not have a value. "\
          "Use --input-file to provide a value for '#{@name}' or specify a  "\
          "value with `attribute('#{@name}', value: 'somevalue', ...)`.",
        ) if Inspec::BaseCLI.inspec_cli_command == :exec
      end

      def method_missing(*_)
        self
      end

      def respond_to_missing?(_, _)
        true
      end

      def to_s
        "Input '#{@name}' does not have a value. Skipping test."
      end

      def is_a?(klass)
        if klass == Inspec::Attribute::DEFAULT_ATTRIBUTE
          Inspec.deprecate(:rename_attributes_to_inputs, "Don't check for `is_a?(Inspec::Attribute::DEFAULT_ATTRIBUTE)`, check for `Inspec::Input::NO_VALUE_SET")
          true # lie for backward compatibility
        else
          super(klass)
        end
      end

      def kind_of?(klass)
        if klass == Inspec::Attribute::DEFAULT_ATTRIBUTE
          Inspec.deprecate(:rename_attributes_to_inputs, "Don't check for `kind_of?(Inspec::Attribute::DEFAULT_ATTRIBUTE)`, check for `Inspec::Input::NO_VALUE_SET")
          true # lie for backward compatibility
        else
          super(klass)
        end
      end
    end
  end

  class Input
    #===========================================================================#
    #                       Class Inspec::Input
    #===========================================================================#

    # Validation types for input values
    VALID_TYPES = %w{
      String
      Numeric
      Regexp
      Array
      Hash
      Boolean
      Any
    }.freeze

    # If you call `input` in a control file, the input will receive this priority.
    # You can override that with a :priority option.
    DEFAULT_PRIORITY_FOR_DSL_ATTRIBUTES = 20

    # If you somehow manage to initialize an Input outside of the DSL,
    # AND you don't provide an Input::Event, this is the priority you get.
    DEFAULT_PRIORITY_FOR_UNKNOWN_CALLER = 10

    # If you directly call value=, this is the priority assigned.
    # This is the highest priority within InSpec core; though plugins
    # are free to go higher.
    DEFAULT_PRIORITY_FOR_VALUE_SET = 60

    attr_reader :description, :events, :identifier, :name, :required, :title, :type

    def initialize(name, options = {})
      @name = name
      @opts = options
      if @opts.key?(:default)
        Inspec.deprecate(:attrs_value_replaces_default, "input name: '#{name}'")
        if @opts.key?(:value)
          Inspec::Log.warn "Input #{@name} created using both :default and :value options - ignoring :default"
          @opts.delete(:default)
        end
      end

      # Array of Input::Event objects.  These compete with one another to determine
      # the value of the input when value() is called, as well as providing a
      # debugging record of when and how the value changed.
      @events = []
      events.push make_creation_event(options)

      update(options)
    end

    def set_events
      events.select { |e| e.action == :set }
    end

    def diagnostic_string
      "Input #{name}, with history:\n" +
        events.map(&:diagnostic_string).map { |line| "  #{line}" }.join("\n")
    end

    #--------------------------------------------------------------------------#
    #                           Managing Value
    #--------------------------------------------------------------------------#

    def update(options)
      _update_set_metadata(options)
      normalize_type_restriction!

      # Values are set by passing events in; but we can also infer an event.
      if options.key?(:value) || options.key?(:default)
        if options.key?(:event)
          if options.key?(:value) || options.key?(:default)
            Inspec::Log.warn "Do not provide both an Event and a value as an option to attribute('#{name}') - using value from event"
          end
        else
          self.class.infer_event(options) # Sets options[:event]
        end
      end
      events << options[:event] if options.key? :event

      enforce_type_restriction!
    end

    # We can determine a value:
    # 1. By event.value (preferred)
    # 2. By options[:value]
    # 3. By options[:default] (deprecated)
    def self.infer_event(options)
      # Don't rely on this working; you really should be passing a proper Input::Event
      # with the context information you have.
      location = Input::Event.probe_stack
      event = Input::Event.new(
        action: :set,
        provider: options[:provider] || :unknown,
        priority: options[:priority] || Inspec::Input::DEFAULT_PRIORITY_FOR_UNKNOWN_CALLER,
        file: location.path,
        line: location.lineno,
      )

      if options.key?(:default)
        Inspec.deprecate(:attrs_value_replaces_default, "attribute name: '#{name}'")
        if options.key?(:value)
          Inspec::Log.warn "Input #{@name} created using both :default and :value options - ignoring :default"
          options.delete(:default)
        else
          options[:value] = options.delete(:default)
        end
      end
      event.value = options[:value] if options.key?(:value)
      options[:event] = event
    end

    private

    def _update_set_metadata(options)
      # Basic metadata
      @title = options[:title] if options.key?(:title)
      @description = options[:description] if options.key?(:description)
      @required = options[:required] if options.key?(:required)
      @identifier = options[:identifier] if options.key?(:identifier) # TODO: determine if this is ever used
      @type = options[:type] if options.key?(:type)
    end

    def make_creation_event(options)
      loc = options[:location] || Event.probe_stack
      Input::Event.new(
        action: :create,
        provider: options[:provider],
        file: loc.path,
        line: loc.lineno,
      )
    end

    # Determine the current winning value, but don't validate it
    def current_value
      # Examine the events to determine highest-priority value. Tie-break
      # by using the last one set.
      events_that_set_a_value = events.select(&:value_has_been_set?)
      winning_priority = events_that_set_a_value.map(&:priority).max
      winning_events = events_that_set_a_value.select { |e| e.priority == winning_priority }
      winning_event = winning_events.last # Last for tie-break

      if winning_event.nil?
        # No value has been set - return special no value object
        NO_VALUE_SET.new(name)
      else
        winning_event.value # May still be nil
      end
    end

    public

    def value=(new_value, priority = DEFAULT_PRIORITY_FOR_VALUE_SET)
      # Inject a new Event with the new value.
      location = Event.probe_stack
      events << Event.new(
        action: :set,
        provider: :value_setter,
        priority: priority,
        value: new_value,
        file: location.path,
        line: location.lineno,
      )
      enforce_type_restriction!

      new_value
    end

    def value
      enforce_required_validation!
      current_value
    end

    def has_value?
      !current_value.is_a? NO_VALUE_SET
    end

    #--------------------------------------------------------------------------#
    #                               Marshalling
    #--------------------------------------------------------------------------#

    def to_hash
      as_hash = { name: name, options: {} }
      [:description, :title, :identifier, :type, :required, :value].each do |field|
        val = send(field)
        next if val.nil?
        as_hash[:options][field] = val
      end
      as_hash
    end

    def ruby_var_identifier
      identifier || 'attr_' + name.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
    end

    def to_ruby
      res = ["#{ruby_var_identifier} = attribute('#{name}',{"]
      res.push "  title: '#{title}'," unless title.to_s.empty?
      res.push "  value: #{value.inspect}," unless value.to_s.empty?
      # to_ruby may generate code that is to be used by older versions of inspec.
      # Anything older than 3.4 will not recognize the value: option, so
      # send the default: option as well. See #3759
      res.push "  default: #{value.inspect}," unless value.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push '})'
      res.join("\n")
    end

    #--------------------------------------------------------------------------#
    #                           Value Type Coercion
    #--------------------------------------------------------------------------#

    def to_s
      "Input #{name} with #{current_value}"
    end

    #--------------------------------------------------------------------------#
    #                               Validation
    #--------------------------------------------------------------------------#

    private

    def enforce_required_validation!
      return unless required
      # skip if we are not doing an exec call (archive/vendor/check)
      return unless Inspec::BaseCLI.inspec_cli_command == :exec

      proposed_value = current_value
      if proposed_value.nil? || proposed_value.is_a?(NO_VALUE_SET)
        error = Inspec::Input::RequiredError.new
        error.input_name = name
        raise error, "Input '#{error.input_name}' is required and does not have a value."
      end
    end

    def enforce_type_restriction! # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      return unless type
      return unless has_value?

      type_req = type
      return if type_req == 'Any'

      proposed_value = current_value

      invalid_type = false
      if type_req == 'Regexp'
        invalid_type = true if !valid_regexp?(proposed_value)
      elsif type_req == 'Numeric'
        invalid_type = true if !valid_numeric?(proposed_value)
      elsif type_req == 'Boolean'
        invalid_type = true if ![true, false].include?(proposed_value)
      elsif proposed_value.is_a?(Module.const_get(type_req)) == false
        # TODO: why is this case here?
        invalid_type = true
      end

      if invalid_type == true
        error = Inspec::Input::ValidationError.new
        error.input_name = @name
        error.input_value = proposed_value
        error.input_type = type_req
        raise error, "Input '#{error.input_name}' with value '#{error.input_value}' does not validate to type '#{error.input_type}'."
      end
    end

    def normalize_type_restriction!
      return unless type

      type_req = type.capitalize
      abbreviations = {
        'Num' => 'Numeric',
        'Regex' => 'Regexp',
      }
      type_req = abbreviations[type_req] if abbreviations.key?(type_req)
      if !VALID_TYPES.include?(type_req)
        error = Inspec::Input::TypeError.new
        error.input_type = type_req
        raise error, "Type '#{error.input_type}' is not a valid input type."
      end
      @type = type_req
    end

    def valid_numeric?(value)
      Float(value)
      true
    rescue
      false
    end

    def valid_regexp?(value)
      # check for invalid regex syntax
      Regexp.new(value)
      true
    rescue
      false
    end
  end
end
