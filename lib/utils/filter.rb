# encoding: utf-8
# author: Dominik Richter
# author: Stephan Renatus
# author: Christoph Hartmann

module FilterTable
  # This is used as a sentinel value in custom property filtering
  module NoCriteriaProvided; end

  class ExceptionCatcher
    def initialize(original_resource, original_exception)
      @original_resource = original_resource
      @original_exception = original_exception
    end

    # This method is called via the runner and signals RSpec to output a block
    # showing why the resource was skipped. This prevents the resource from
    # being added to the test collection and being evaluated.
    def resource_skipped?
      @original_exception.is_a?(Inspec::Exceptions::ResourceSkipped)
    end

    # This method is called via the runner and signals RSpec to output a block
    # showing why the resource failed. This prevents the resource from
    # being added to the test collection and being evaluated.
    def resource_failed?
      @original_exception.is_a?(Inspec::Exceptions::ResourceFailed)
    end

    def resource_exception_message
      @original_exception.message
    end

    # Capture message chains and return `ExceptionCatcher` objects
    def method_missing(*)
      self
    end

    # RSpec will check the object returned to see if it responds to a method
    # before calling it. We need to fake it out and tell it that it does. This
    # allows it to skip past that check and fall through to #method_missing
    def respond_to?(_method)
      true
    end

    def to_s
      @original_resource.to_s
    end
    alias inspect to_s
  end

  class Trace
    def initialize
      @chain = []
    end

    %w{== != >= > < <= =~ !~}.each do |m|
      define_method m.to_sym do |*args|
        res = Trace.new
        @chain.push([[m.to_sym] + args, res])
        res
      end
    end

    def method_missing(*args)
      res = Trace.new
      @chain.push([args, res])
      res
    end

    def self.to_ruby(trace)
      chain = trace.instance_variable_get(:@chain)
      return '' if chain.empty?
      ' ' + chain.map do |el|
        m = el[0][0]
        args = el[0].drop(1)
        nxt = to_ruby(el[1])
        next m.to_s + nxt if args.empty?
        next m.to_s + ' ' + args[0].inspect + nxt if args.length == 1
        m.to_s + '(' + args.map(&:inspect).join(', ') + ')' + nxt
      end.join(' ')
    end
  end

  class Table
    attr_reader :raw_data, :resource_instance, :criteria_string
    def initialize(resource_instance, raw_data, criteria_string)
      @resource_instance = resource_instance
      @raw_data = raw_data
      @raw_data = [] if @raw_data.nil?
      @criteria_string = criteria_string
    end

    # Filter the raw data based on criteria (as method params) or by evaling a
    # block; then construct a new Table of the same class as ourselves,
    # wrapping the filtered data, and return it.
    def where(conditions = {}, &block)
      return self if !conditions.is_a?(Hash)
      return self if conditions.empty? && !block_given?

      # Initialize the details of the new Table.
      new_criteria_string = criteria_string
      filtered_raw_data = raw_data

      # If we were provided params, interpret them as criteria to be evaluated
      # against the raw data. Criteria are assumed to be hash keys.
      conditions.each do |raw_field_name, desired_value|
        new_criteria_string += " #{raw_field_name} == #{desired_value.inspect}"
        filtered_raw_data = filter_raw_data(filtered_raw_data, raw_field_name, desired_value)
      end

      # If we were given a block, make a special Struct for each row, that has an accessor
      # for each field declared using `register_custom_property`, then instance-eval the block
      # against the struct.
      if block_given?
        # Perform the filtering.
        filtered_raw_data = filtered_raw_data.find_all { |e| new_entry(e, '').instance_eval(&block) }
        # Try to interpret the block for updating the stringification.
        src = Trace.new
        src.instance_eval(&block)
        new_criteria_string += Trace.to_ruby(src)
      end

      self.class.new(resource, filtered_raw_data, new_criteria_string)
    end

    def new_entry(*_)
      raise "#{self.class} must not be used on its own. It must be inherited "\
           'and the #new_entry method must be implemented. This is an internal '\
           'error and should not happen.'
    end

    def resource
      resource_instance
    end

    def params
      # TODO: consider deprecating
      raw_data
    end

    def entries
      row_criteria_string = resource.to_s + criteria_string + ' one entry'
      raw_data.map do |row|
        new_entry(row, row_criteria_string)
      end
    end

    def get_column_values(field)
      raw_data.map do |row|
        row[field]
      end
    end

    def to_s
      resource.to_s + criteria_string
    end

    alias inspect to_s

    private

    def matches_float(x, y)
      return false if x.nil?
      return false if !x.is_a?(Float) && (x =~ /\A[-+]?(\d+\.?\d*|\.\d+)\z/).nil?
      x.to_f == y
    end

    def matches_int(x, y)
      return false if x.nil?
      return false if !x.is_a?(Integer) && (x =~ /\A[-+]?\d+\z/).nil?
      x.to_i == y
    end

    def matches_regex(x, y)
      return x == y if x.is_a?(Regexp)
      !x.to_s.match(y).nil?
    end

    def matches(x, y)
      x === y # rubocop:disable Style/CaseEquality
    end

    def filter_raw_data(current_raw_data, field, desired_value)
      method_ref = case desired_value
                   when Float   then method(:matches_float)
                   when Integer then method(:matches_int)
                   when Regexp  then method(:matches_regex)
                   else              method(:matches)
                   end

      current_raw_data.find_all do |row|
        next unless row.key?(field)
        method_ref.call(row[field], desired_value)
      end
    end
  end

  class Factory
    CustomPropertyType = Struct.new(:field_name, :block, :opts)

    def initialize
      @filter_methods = []
      @custom_properties = {}
      @resource = nil # TODO: this variable is never initialized
    end

    def install_filter_methods_on_resource(resource_class, raw_data_fetcher_method_name)
      struct_fields = @custom_properties.values.map(&:field_name)

      # the struct to hold single items from the #entries method
      entry_struct_type = Struct.new(*struct_fields.map(&:to_sym)) do
        attr_accessor :criteria_string
        def to_s
          @criteria_string || super
        end
      end unless struct_fields.empty?

      properties_to_define = @custom_properties.map do |method_name, custom_property_structure|
        { method_name: method_name, method_body: create_custom_property_body(custom_property_structure) }
      end

      # Define the filter table subclass
      table_class = Class.new(Table) {
        # Install each custom property onto the FilterTable subclass
        properties_to_define.each do |property_info|
          define_method property_info[:method_name], &property_info[:method_body]
        end

        # Install a special new_entry method to boost raw rows into a Struct
        define_method :new_entry do |row_as_hash, criteria_string = ''|
          return entry_struct_type.new if row_as_hash.nil?
          res = entry_struct_type.new(*struct_fields.map { |field| row_as_hash[field] })
          res.criteria_string = criteria_string
          res
        end
      }

      # Define all access methods with the parent resource_class
      # These methods will be configured to return an `ExceptionCatcher` object
      # that will always return the original exception, but only when called
      # upon. This will allow method chains in `describe` statements to pass the
      # `instance_eval` when loaded and only throw-and-catch the exception when
      # the tests are run.
      methods_to_install_on_resource_class = @filter_methods + @custom_properties.keys
      methods_to_install_on_resource_class.each do |method_name|
        resource_class.send(:define_method, method_name.to_sym) do |*args, &block|
          begin
            # self here is the resource instance
            filter_table_instance = table_class.new(self, method(raw_data_fetcher_method_name).call, ' with')
            filter_table_instance.method(method_name.to_sym).call(*args, &block)
          rescue Inspec::Exceptions::ResourceFailed, Inspec::Exceptions::ResourceSkipped => e
            FilterTable::ExceptionCatcher.new(resource_class, e)
          end
        end
      end
    end

    alias connect install_filter_methods_on_resource

    # TODO: This should almost certainly be privatized.  Every FilterTable client should get :entries and :where;
    # InSpec core resources do not define anything else, other than azure_generic_resource, which is likely a mis-use.
    def register_filter_method(method_name)
      if method_name.nil?
        # TODO: @resource is never initialized
        throw RuntimeError, "Called filter.add_accessor for resource #{@resource} with method name nil!"
      end
      @filter_methods.push(method_name.to_sym)
      self
    end

    alias add_accessor register_filter_method

    def register_custom_property(property_name, opts = {}, &property_implementation)
      if property_name.nil?
        # TODO: @resource is never initialized
        throw RuntimeError, "Called filter.add for resource #{@resource} with method name nil!"
      end

      @custom_properties[property_name.to_sym] =
        CustomPropertyType.new(opts[:field] || property_name, property_implementation, opts)
      self
    end

    alias add register_custom_property

    private

    # This provides the implementation for methods requested using
    # register_custom_property(:some_method_name, opts, &block)
    # Some usage in the wild involves people passing a desired value to the generated method, like:
    #  things.ids(23)
    # I'm calling this the 'filter_criterion_value'. I speculate that a default value is
    # provided here so that users can meaningfully query for nil.
    def create_custom_property_body(custom_property_struct)
      if !custom_property_struct.block.nil?
        # If the custom method provided its own block, rely on it.
        lambda do |filter_criteria_value = NoCriteriaProvided|
          # Here self is an instance of the FilterTable subclass that wraps the raw data.
          # Call the block with two args - the table instance, and any filter criteria value.
          custom_property_struct.block.call(self, filter_criteria_value)
        end
      else
        # No block definition, so the property was registered using (field: :some_field)
        # This does however support passing a block to this method, and filtering using it, like Enumerable#select.
        lambda do |filter_criteria_value = NoCriteriaProvided, &cond_block|
          if filter_criteria_value == NoCriteriaProvided && !block_given?
            # No second-order block given.  Just return an array of the values in the selected column.
            result = where(nil).get_column_values(custom_property_struct.field_name) # TODO: the where(nil). is likely unneeded
            result = result.flatten.uniq.compact if custom_property_struct.opts[:style] == :simple
            result
          else
            # A secondary block was provided.  Rely on where() to execute the block, while also filtering on any single value
            # Suspected bug: if filter_criteria_value == NoCriteriaProvided, this is unlikely to match - see hash condition handling in where() above.
            where(custom_property_struct.field_name => filter_criteria_value, &cond_block)
          end
        end
      end
    end
  end

  def self.create
    Factory.new
  end
end
