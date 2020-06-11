# frozen_string_literal: true

require 'necromancer'

module TTY
  class Table
    # A class responsible for column alignments
    #
    # Used internally by {TTY::Table::Operation::Alignment}
    class AlignmentSet
      include Enumerable

      DEFAULT = :left

      # Initialize an AlignmentSet
      #
      # @param [AlignmentSet, Array] alignments
      #   the alignments for the renderer
      #
      # @api private
      def initialize(alignments)
        @alignments = Necromancer.convert(alignments).to(:array).map(&:to_sym)
      end

      # Iterate over each element in the alignment set
      #
      # @example
      #   alignment = AlignmentSet.new [1,2,3]
      #   alignment.each { |element| ... }
      #
      # @return [self]
      #
      # @api public
      def each
        return to_enum unless block_given?
        to_ary.each { |element| yield element }
        self
      end

      # Lookup an alignment by index
      #
      # @param [Integer] index
      #
      # @return [Symbol] alignment
      #
      # @api public
      def [](index)
        alignments.fetch(index, DEFAULT)
      end

      # Convert to array
      #
      # @return [Array]
      #
      # @api public
      def to_ary
        alignments.to_a
      end

      # String representation of aligments
      #
      # @return [String]
      #
      # @api public
      def to_s
        to_ary
      end

      protected

      attr_reader :alignments
    end # AlignmentSet
  end # Table
end # TTY
