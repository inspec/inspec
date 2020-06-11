# frozen_string_literal: true

module TTY
  class Table
    module Operation
      # A class responsible for escaping special chars in a table field
      #
      # @api private
      class Escape

        # Escape special characters in a table field
        #
        # @param [TTY::Table::Field] field
        #
        # @param [Integer] row
        #   the field row index
        #
        # @param [Integer] col
        #   the field column index
        #
        # @api public
        def call(field, row, col)
          field.content.gsub(/(\t|\r|\n)/) do |val|
            val.dump.gsub('"', '')
          end
        end
      end # Escape
    end # Operation
  end # Table
end # TTY
