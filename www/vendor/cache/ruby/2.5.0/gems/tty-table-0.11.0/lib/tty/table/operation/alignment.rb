# frozen_string_literal: true

require 'strings'

module TTY
  class Table
    module Operation
      # A class which responsiblity is to align table rows and header.
      class Alignment
        DEFAULT = :left

        # Initialize an Alignment operation
        #
        # @api private
        def initialize(alignments, widths = nil)
          @alignments = alignments
          @widths     = widths
        end

        # Evaluate alignment of the provided row
        #
        # @param [TTY::Table::Field] field
        #   the table field
        #
        # @param [Array] row
        #  the table row
        #
        # @param [Integer] col
        #   the table column index
        #
        # @return [TTY::Table::Field]
        #
        # @api public
        def call(field, row, col)
          align_field(field, col)
        end

        protected

        attr_reader :alignments

        attr_reader :widths

        # Align each field in a row
        #
        # @param [TTY::Table::Field] field
        #   the table field
        #
        # @param [Integer] col
        #   the table column index
        #
        # @return [TTY::Table::Field]
        #
        # @api private
        def align_field(field, col)
          column_width = widths[col]
          direction    = field.alignment || alignments[col] || DEFAULT
          Strings.align(field.content, column_width, direction: direction)
        end
      end # Alignment
    end # Operation
  end # Table
end # TTY
