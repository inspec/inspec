require "tty-table"

module Inspec
  class UI
    class TableHelper < TTY::Table
      def header=(ary)
        cells = ary.dup.map { |label| { value: label, alignment: :center } }
        @header = TTY::Table::Header.new(cells)
      end
    end
  end
end
