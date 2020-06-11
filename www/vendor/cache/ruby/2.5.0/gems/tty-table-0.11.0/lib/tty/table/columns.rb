# frozen_string_literal: true

require_relative 'error'

module TTY
  class Table
    # A module for calculating table data column widths
    #
    # Used by {Table} to manage column sizing.
    #
    # @api private
    module Columns
      # Calculate total table width
      #
      # @return [Integer]
      #
      # @api public
      def total_width(data)
        extract_widths(data).reduce(:+)
      end
      module_function :total_width

      # Calcualte maximum column widths
      #
      # @return [Array] column widths
      #
      # @api private
      def extract_widths(data)
        colcount = data.max { |row_a, row_b| row_a.size <=> row_b.size }.size
        (0...colcount).reduce([]) do |maximas, col_index|
          maximas << find_maximum(data, col_index)
          maximas
        end
      end
      module_function :extract_widths

      # Find a maximum column width. The calculation takes into account
      # wether the content is escaped or not.
      #
      # @param [Integer] index
      #   the column index
      #
      # @return [Integer]
      #
      # @api private
      def find_maximum(data, index)
        data.map do |row|
          (field = row.call(index)) ? field.length : 0
        end.max
      end
      module_function :find_maximum

      # Converts column widths to array format or infers default widths
      #
      # @param [TTY::Table] table
      #
      # @param [Array, Numeric, NilClass] column_widths
      #
      # @return [Array[Integer]]
      #
      # @api public
      def widths_from(table, column_widths = nil)
        case column_widths
        when Array
          assert_widths(column_widths, table.columns_size)
          Array(column_widths).map(&:to_i)
        when Numeric
          Array.new(table.columns_size, column_widths)
        when NilClass
          extract_widths(table.data)
        else
          fail TypeError, 'Invalid type for column widths'
        end
      end
      module_function :widths_from

      # Assert data integrity for column widths
      #
      # @param [Array] column_widths
      #
      # @param [Integer] table_widths
      #
      # @raise [TTY::InvalidArgument]
      #
      # @api public
      def assert_widths(column_widths, table_widths)
        if column_widths.empty?
          fail InvalidArgument, 'Value for :column_widths must be ' \
                                 'a non-empty array'
        end
        if column_widths.size != table_widths
          fail InvalidArgument, 'Value for :column_widths must match ' \
                                 'table column count'
        end
      end
      module_function :assert_widths
    end # Columns
  end # Table
end # TTY
