# frozen_string_literal: true

require_relative '../border/unicode'

module TTY
  class Table
    module Renderer
      # Unicode representation of table renderer
      #
      # @api private
      class Unicode < Basic
        # Create Unicode renderer
        #
        # @param [Table] table
        #
        # @api private
        def initialize(table, options = {})
          super(table, options.merge(border_class: TTY::Table::Border::Unicode))
        end
      end # Unicode
    end # Renderer
  end # Table
end # TTY
