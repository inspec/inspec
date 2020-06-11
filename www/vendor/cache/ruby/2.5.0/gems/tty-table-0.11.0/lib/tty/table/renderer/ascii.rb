# frozen_string_literal: true

require_relative '../border/ascii'
require_relative '../renderer/basic'

module TTY
  class Table
    module Renderer
      class ASCII < Basic
        # Create ASCII renderer
        #
        # @api private
        def initialize(table, options = {})
          super(table, options.merge(border_class: TTY::Table::Border::ASCII))
        end
      end # ASCII
    end # Renderer
  end # Table
end # TTY
