# frozen_string_literal: true

module TTY
  class Table
    class Empty < TTY::Table

      ZERO_ROW = [].freeze

      def self.new(header, rows = ZERO_ROW)
        super.new(header, rows)
      end

      def each
        return to_enum unless block_given?
        self
      end

      def size
        0
      end

      def width
        0
      end

    end # Empty
  end # Table
end # TTY
