# frozen_string_literal: true

module TTY
  class Table
    # Raised when inserting into table with a mismatching row(s)
    class DimensionMismatchError < ArgumentError; end

    # Raised when reading non-existent element from a table
    class TupleMissing < IndexError
      attr_reader :i, :j

      def initialize(i, j)
        @i, @j = i, j
        super("element at(#{i},#{j}) not found")
      end
    end

    # Raised when the table orientation is unkown
    class InvalidOrientationError < ArgumentError; end

    # Raised when the table cannot be resized
    class ResizeError < ArgumentError; end

    # Raised when the operation is not implemented
    class NoImplementationError < NotImplementedError; end

    # Raised when the argument type is different from expected
    class TypeError < ArgumentError; end

    # Raised when the required argument is not supplied
    class ArgumentRequired < ArgumentError; end

    # Raised when the argument is not expected
    class InvalidArgument < ArgumentError; end

    # Raised when the attribute is unknown
    class UnknownAttributeError < IndexError; end
  end # Table
end # TTY
