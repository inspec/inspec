# frozen_string_literal: true

module TTY
  class Table
    # A class representing table orientation
    class Orientation
      # A class responsible for vertical table transformation
      class Vertical < Orientation
        # Rotate table vertically
        #
        # @param [Table] table
        #
        # @return [nil]
        #
        # @api public
        def transform(table)
          table.rotate_vertical
        end

        # Slice horizontal table data into vertical
        #
        # @param [Table] table
        #
        # @api public
        def slice(table)
          header    = table.header
          rows_size = table.rows_size

          head = header ? header : (0..rows_size).map { |n| (n + 1).to_s }

          (0...rows_size).reduce([]) do |array, index|
            array + head.zip(table.rows[index]).map { |row| table.to_row(row) }
          end
        end
      end # Vertical
    end # Orientation
  end # Table
end # TTY
