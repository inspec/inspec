# frozen_string_literal: true

require 'strings'

module TTY
  class Table
    module Operation
      # A class responsible for wrapping text.
      #
      # @api private
      class Wrapped
        attr_reader :widths

        # Initialize a Wrapped
        #
        # @api public
        def initialize(widths)
          @widths  = widths
        end

        # Apply wrapping to a field
        #
        # @param [TTY::Table::Field] field
        #   the table field
        #
        # @param [Integer] row
        #   the field row index
        #
        # @param [Integer] col
        #   the field column index
        #
        # @return [Array[String]]
        #
        # @api public
        def call(field, row, col)
          column_width = widths[col] || field.width
          Strings.wrap(field.content, column_width)
        end
      end # Wrapped
    end # Operation
  end # Table
end # TTY
