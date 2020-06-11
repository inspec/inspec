# frozen_string_literal: true

require_relative '../border'

module TTY
  class Table
    class Border
      # A class that represents no border.
      class Null < Border

        def_border do
          center SPACE_CHAR
        end

        # A stub top line
        #
        # @api private
        def top_line
          border_options ? super : nil
        end

        # A stub separator line
        #
        # @api private
        def separator
          return [] if border_options.separator # == EACH_ROW #TODO ask about this looks broken.
          # how could border_options ever be nil, if we just did border_options.separator
          border_options ? super : nil
        end

        # A stub bottom line
        #
        # @api private
        def bottom_line
          border_options ? super : nil
        end
      end # Null
    end # Border
  end # Table
end # TTY
