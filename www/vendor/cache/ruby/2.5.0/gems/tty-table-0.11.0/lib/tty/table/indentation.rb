# frozen_string_literal: true

module TTY
  class Table
    # A module responsible for indenting table representation
    module Indentation
      # Return a table part with indentation inserted
      #
      # @param [#map, #to_s] part
      #   the rendered table part
      #
      # @api public
      def indent(part, indentation)
        if part.respond_to?(:to_a)
          part.map { |line| insert_indentation(line, indentation) }
        else
          insert_indentation(part, indentation)
        end
      end
      module_function :indent

      # Insert indentation into a table renderd line
      #
      # @param [#to_a, #to_s] line
      #   the rendered table line
      #
      # @api public
      def insert_indentation(line, indentation)
        line = Array(line)[0]
        ' ' * indentation + line.to_s if line
      end
      module_function :insert_indentation
    end # Indentation
  end # Table
end # TTY
