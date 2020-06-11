# frozen_string_literal: true

module TTY
  class Table
    # A class for transforming table values
    #
    # Used internally by {Table}
    #
    # @api private
    class Transformation
      # Extract the header and row tuples from the value
      #
      # @param [Array] args
      #
      # @return [Object]
      #
      # @api public
      def self.extract_tuples(args)
        rows   = args.pop
        header = args.size.zero? ? nil : args.first
        if rows.first.is_a?(Hash)
          header, rows = group_header_and_rows(rows)
        end
        { header: header, rows: rows }
      end

      # Group hash keys into header and values into rows
      #
      # @param [Hash] value
      #
      # @api public
      def self.group_header_and_rows(value)
        header = value.map(&:keys).flatten.uniq
        rows   = value.reduce([]) { |arr, el| arr + el.values }
        [header, rows]
      end
    end # Transformation
  end # Table
end # TTY
