# frozen_string_literal: true

module TTY
  class Table
    # A class holding table field operations.
    #
    # @api private
    class Operations
      # Initialize Operations
      #
      # @api public
      def initialize
        @operations = Hash.new { |hash, key| hash[key] = [] }
      end

      # Add operation
      #
      # @param [Symbol] operation_type
      #   the operation type
      # @param [Object] object
      #   the callable object
      #
      # @return [Hash]
      #
      # @api public
      def add(operation_type, object)
        operations[operation_type] << object
      end

      # Lookup operation
      #
      # @param [Symbol] operation
      #
      # @return [Object]
      #   the operation
      #
      # @api public
      def [](operation)
        operations[operation]
      end

      # Apply operations to a table data
      #
      # @param [Array[Symbol]] types
      #  the operation types
      # @param [Hash] options
      #   the options for the row
      #
      # @return [TTY::Table]
      #
      # @api public
      def apply_to(table, *args)
        operation_types = args
        table.data.each_with_index do |row, row_i|
          row.fields.each_with_index do |field, col_i|
            field.reset!
            operation_types.each do |type|
              operations[type].each do |operation|
                field.content = operation.(field, row_i, col_i)
              end
            end
          end
        end
      end

      protected

      # Available operations
      #
      # @return [Hash]
      #
      # @api public
      attr_reader :operations
    end # Operations
  end # Table
end # TTY
