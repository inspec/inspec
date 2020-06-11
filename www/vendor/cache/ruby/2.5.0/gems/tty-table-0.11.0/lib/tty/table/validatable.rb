# frozen_string_literal: true

require_relative 'error'

module TTY
  class Table
    # Mixin to provide validation for {Table}.
    #
    # Include this mixin to add validation for options.
    #
    # @api private
    module Validatable
      # Check if table rows are the equal size
      #
      # @raise [DimensionMismatchError]
      #   if the rows are not equal length
      #
      # @return [nil]
      #
      # @api private
      def assert_row_sizes(rows)
        size = (rows[0] || []).size
        rows.each do |row|
          next if row.size == size
          fail TTY::Table::DimensionMismatchError,
               "row size differs (#{row.size} should be #{size})"
        end
      end

      # Check if table type is provided
      #
      # @raise [ArgumentRequired]
      #
      # @return [Table]
      #
      # @api private
      def assert_table_type(value)
        return value if value.is_a?(TTY::Table)
        fail ArgumentRequired,
             "Expected TTY::Table instance, got #{value.inspect}"
      end

      # def assert_matching_widths(rows)
      # end
      #
      # def assert_string_values(rows)
      # end

      # Check if options are of required type
      #
      # @api private
      def validate_options!(options)
        header = options[:header]
        rows   = options[:rows]

        if header && (!header.is_a?(Array) || header.empty?)
          fail InvalidArgument, ':header must be a non-empty array'
        end

        if rows && !(rows.is_a?(Array) || rows.is_a?(Hash))
          fail InvalidArgument, ':rows must be a non-empty array or hash'
        end
      end
    end # Validatable
  end # Table
end # TTY
