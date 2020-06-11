# frozen_string_literal: true

require 'forwardable'

require_relative 'error'
require_relative 'field'

module TTY
  class Table
    # Convert an Array row into Header
    #
    # @return [TTY::Table::Header]
    #
    # @api private
    def to_header(row)
      Header.new(row)
    end

    # A set of header elements that correspond to values in each row
    class Header
      include Enumerable
      extend Forwardable

      def_delegators :@attributes, :join, :map, :map!

      # The header attributes
      #
      # @return [Array]
      #
      # @api private
      attr_reader :attributes
      alias :fields :attributes

      # Initialize a Header
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attributes = [])
        @attributes    = attributes.map { |attr| to_field(attr) }
        @attribute_for = Hash[@attributes.each_with_index.map.to_a]
      end

      # Iterate over each element in the vector
      #
      # @example
      #   header = TTY::Table::Header.new [1,2,3]
      #   header.each { |element| ... }
      #
      # @return [self]
      #
      # @api public
      def each
        return to_enum unless block_given?
        to_ary.each { |element| yield element }
        self
      end

      # Instantiates a new field
      #
      # @param [String,Hash] attribute
      #   the attribute value to convert to field object
      #
      # @api public
      def to_field(attribute = nil)
        Field.new(attribute)
      end

      # Lookup a column in the header given a name
      #
      # @param [Integer, String] attribute
      #   the attribute to look up by
      #
      # @api public
      def [](attribute)
        case attribute
        when Integer
          @attributes[attribute].value
        else
          @attribute_for.fetch(to_field(attribute)) do |header_name|
            fail UnknownAttributeError,
                 "the header '#{header_name.value}' is unknown"
          end
        end
      end

      # Lookup attribute without evaluation
      #
      # @api public
      def call(attribute)
        @attributes[attribute]
      end

      # Set value at index
      #
      # @example
      #   header[attribute] = value
      #
      # @api public
      def []=(attribute, value)
        attributes[attribute] = to_field(value)
      end

      # Size of the header
      #
      # @return [Integer]
      #
      # @api public
      def size
        to_ary.size
      end
      alias :length :size

      # Find maximum header height
      #
      # @return [Integer]
      #
      # @api public
      def height
        attributes.map { |field| field.height }.max
      end

      # Convert the Header into an Array
      #
      # @return [Array]
      #
      # @api public
      def to_ary
        attributes.map { |attr| attr.value if attr }
      end

      # Return the header elements in an array.
      #
      # @return [Array]
      #
      # @api public
      def to_a
        to_ary.dup
      end

      # Check if there are no elements.
      #
      # @return [Boolean]
      #
      # @api public
      def empty?
        to_ary.empty?
      end

      # Check if this header is equivalent to another header
      #
      # @return [Boolean]
      #
      # @api public
      def ==(other)
        to_a == other.to_a
      end
      alias :eql? :==

      # Provide an unique hash value
      #
      # @api public
      def to_hash
        to_a.hash
      end

      def inspect
        "#<#{self.class.name} fields=#{to_a}>"
      end
    end # Header
  end # Table
end # TTY
