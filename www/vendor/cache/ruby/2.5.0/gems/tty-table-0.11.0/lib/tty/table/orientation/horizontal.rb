# frozen_string_literal: true

module TTY
  class Table
    # A class representing table orientation
    class Orientation
      # A class responsible for horizontal table transformation
      class Horizontal < Orientation
        # Rotate table horizontally
        #
        # @param [Table] table
        #
        # @return [nil]
        #
        # @api public
        def transform(table)
          table.rotate_horizontal
        end

        # Slice vertical table data into horizontal
        #
        # @param [Table] table
        #
        # @api public
        def slice(table)
          head, body, array_h, array_b = 4.times.map { [] }
          index         = 0
          first_column  = 0
          second_column = 1

          (0...table.original_columns * table.original_rows).each do |col_index|
            row      = table.rows[index]
            array_h += [row[first_column]]
            array_b += [row[second_column]]

            if col_index % table.original_columns == 2
              head << array_h
              body << array_b
              array_h, array_b = [], []
            end
            index += 1
          end
          [head, body]
        end
      end # Horizontal
    end # Orientation
  end # Table
end # TTY
