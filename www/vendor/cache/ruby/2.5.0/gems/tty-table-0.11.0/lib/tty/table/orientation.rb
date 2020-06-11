# frozen_string_literal: true

require_relative 'orientation/horizontal'
require_relative 'orientation/vertical'

module TTY
  class Table
    # A class representing table orientation
    #
    # @api private
    class Orientation
      # The name for the orientation
      #
      # @api public
      attr_reader :name

      # Initialize an Orientation
      #
      # @api public
      def initialize(name)
        @name = name
      end

      # Coerce the name argument into an orientation
      #
      # @param [Symbol] name
      #
      # @api public
      def self.coerce(name)
        case name.to_s
        when /h|horiz(ontal)?/i
          Horizontal.new :horizontal
        when /v|ert(ical)?/i
          Vertical.new :vertical
        else
          fail InvalidOrientationError,
               'orientation must be one of :horizontal, :vertical'
        end
      end

      # Check if orientation is vertical
      #
      # @return [Boolean]
      #
      # @api public
      def vertical?
        name == :vertical
      end

      # Check if orientation is horizontal
      #
      # @return [Boolean]
      #
      # @api public
      def horizontal?
        name == :horizontal
      end
    end # Orientation
  end # Table
end # TTY
