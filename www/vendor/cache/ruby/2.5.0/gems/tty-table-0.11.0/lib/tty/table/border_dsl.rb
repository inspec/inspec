# frozen_string_literal: true

require 'forwardable'

require_relative 'border_options'

module TTY
  class Table
    # A class responsible for bulding and modifying border
    #
    # Used internally by {Table::Border} to allow for building custom border
    # through DSL
    # @api private
    class BorderDSL
      extend Forwardable

      # Border options
      #
      # @return [Table::BorderOptions]
      attr_reader :options

      def_delegators :@options, :characters

      # Initialize a BorderDSL
      #
      # @param [Hash] characters
      #   the border characters
      #
      # @return [undefined]
      #
      # @api private
      def initialize(characters = nil, &block)
        @options = TTY::Table::BorderOptions.new
        @options.characters = characters if characters
        yield_or_eval(&block) if block_given?
      end

      # Apply style color to the border
      #
      # @param [Symbol] value
      #   the style color for the border
      #
      # @return [undefined]
      #
      # @api public
      def style(value = (not_set = true))
        return options.style if not_set
        options.style = value
      end

      # Apply table tuple separator
      #
      # @param [Symbol] value
      #   the table tuple separator
      #
      # @return [undefined]
      #
      # @api public
      def separator(value)
        value ? options.separator = value : options.separator
      end

      # Set top border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def top(value)
        options.characters['top'] = value
      end

      # Set top middle border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def top_mid(value)
        options.characters['top_mid'] = value
      end

      # Set top left corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def top_left(value)
        options.characters['top_left'] = value
      end

      # Set top right corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def top_right(value)
        options.characters['top_right'] = value
      end

      # Set bottom border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def bottom(value)
        options.characters['bottom'] = value
      end

      # Set bottom middle border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def bottom_mid(value)
        options.characters['bottom_mid'] = value
      end

      # Set bottom left corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def bottom_left(value)
        options.characters['bottom_left'] = value
      end

      # Set bottom right corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def bottom_right(value)
        options.characters['bottom_right'] = value
      end

      # Set middle border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def mid(value)
        options.characters['mid'] = value
      end

      # Set middle border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def mid_mid(value)
        options.characters['mid_mid'] = value
      end

      # Set middle left corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def mid_left(value)
        options.characters['mid_left'] = value
      end

      # Set middle right corner border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def mid_right(value)
        options.characters['mid_right'] = value
      end

      # Set left border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def left(value)
        options.characters['left'] = value
      end

      # Set center border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def center(value)
        options.characters['center'] = value
      end

      # Set right border character
      #
      # @param [String] value
      #   the character value
      #
      # @return [undefined]
      #
      # @api public
      def right(value)
        options.characters['right'] = value
      end

      private

      # Evaluate block
      #
      # @return [Table]
      #
      # @api private
      def yield_or_eval(&block)
        return unless block
        block.arity > 0 ? yield(self) : instance_eval(&block)
      end
    end # BorderDSL
  end # Table
end # TTY
