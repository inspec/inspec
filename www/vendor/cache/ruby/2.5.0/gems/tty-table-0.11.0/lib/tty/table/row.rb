# frozen_string_literal: true

require 'forwardable'

require_relative 'error'
require_relative 'field'

module TTY
  class Table
    # Convert an Array row into Row
    #
    # @return [TTY::Table::Row]
    #
    # @api private
    def to_row(row, header = nil)
      Row.new(row, header)
    end

    # A class that represents a row in a table.
    #
    # Used internally by {Table} to store row represenation by converting
    # {Array} into {Row} instance.
    #
    # @api private
    class Row
      include Enumerable
      extend Forwardable

      # The row attributes that describe each element
      #
      # @return [Array]
      #
      # @api private
      attr_reader :attributes

      # The row data
      #
      # @return [Hash]
      #
      # @api private
      attr_reader :data

      # The row fields
      #
      # @api public
      attr_reader :fields

      def_delegators :to_ary, :join

      # Initialize a Row
      #
      # @example
      #   row = new TTY::Table::Row.new [1,2,3]
      #   row[1]  # => 2
      #
      #   row = new TTY::Table::Row.new [1,2,3], %w[a b c]
      #   row[0]   # => 1
      #   row['a'] # => 1
      #
      #   row = new TTY::Table::Row.new {"a": 1, "b": 2, "c": 3}
      #   row[0]   # => 1
      #   row['a'] # => 1
      #
      # @param [#to_ary] data
      #   the row data
      #
      # @return [undefined]
      #
      # @api public
      def initialize(data, header = nil)
        case data
        when Array
          @attributes = (header || (0...data.length)).to_a
          @fields     = coerce_to_fields(data)
        when Hash
          @data       = data.dup
          @fields     = coerce_to_fields(@data.values)
          @attributes = (header || data.keys).to_a
        end
        @data = Hash[@attributes.zip(fields)]
      end

      # Coerces values to field instances
      #
      # @param [Array[Object]] values
      #
      # @return [Array[TTY::Table::Field]]
      #
      # @api public
      def coerce_to_fields(values)
        values.reduce([]) { |acc, el| acc << to_field(el) }
      end

      # Instantiates a new field
      #
      # @api public
      def to_field(options = nil)
        Field.new(options)
      end

      # Lookup a value in the row given an attribute allowing for Array or
      # Hash like indexing
      #
      # @example
      #   row[1]
      #   row[:id]
      #   row.call(:id)
      #
      # @api public
      def [](attribute)
        case attribute
        when Integer
          data[attributes[attribute]].value
        else
          data.fetch(attribute) do |name|
            fail UnknownAttributeError, "the attribute #{name} is unkown"
          end.value
        end
      end

      # Lookup attribute without evaluation
      #
      # @api public
      def call(attribute)
        data[attributes[attribute]]
      end

      # Set value at index
      #
      # @example
      #   row[attribute] = value
      #
      # @api public
      def []=(attribute, value)
        case attribute
        when Integer
          data[attributes[attribute]] = to_field(value)
        else
          data[attribute] = to_field(value)
          attributes << attribute unless attributes.include?(attribute)
        end
      end

      # Iterate over each element in the Row
      #
      # @example
      #   vec = Row.new [1,2,3], ['a','b','c']
      #   vec.each { |element| ... }
      #
      # @return [self]
      #
      # @api public
      def each
        return to_enum unless block_given?
        to_ary.each { |element| yield element }
        self
      end

      # Number of data items in a row
      #
      # @return [Integer]
      #
      # @api public
      def size
        data.size
      end
      alias :length :size

      # Check if there are no elements
      #
      # @return [Boolean]
      #
      # @api public
      def empty?
        to_ary.empty?
      end

      # Find maximum row height
      #
      # @return [Integer]
      #
      # @api public
      def height
        fields.map(&:height).max
      end

      # Convert the Row into Array
      #
      # @example
      #   array = row.to_ary
      #
      # @return [Array]
      #
      # @api public
      def to_ary
        to_hash.values_at(*attributes)
      end

      # Return the Row elements in an array.
      #
      # @return [Array]
      #
      # @api public
      def to_a
        to_ary.dup
      end

      # Convert the Row into hash
      #
      # @return [Hash]
      #
      # @api public
      def to_hash
        hash = data.dup
        hash.update(hash) { |_, val| val.value if val }
      end

      # Check if this row is equivalent to another row
      #
      # @return [Boolean]
      #
      # @api public
      def ==(other)
        to_a == other.to_a
      end
      alias :eql? :==

      # Provide a unique hash value. If a row contains the same data as another
      # row, they will hash to the same value.
      #
      # @api public
      def hash
        to_a.hash
      end

      # Map field values
      #
      # @api public
      def map!(&block)
        data.values_at(*attributes).each do |field|
          field.value = block.call(field)
        end
      end

      # String representation of a row with its fields
      #
      # @api public
      def inspect
        "#<#{self.class.name} fields=#{to_a}>"
      end
    end # Row
  end # Table
end # TTY
