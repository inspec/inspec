# frozen_string_literal: true

module TTY
  module Box
    # A class reponsible for retrieving border options
    #
    # @api private
    class Border
      BORDER_VALUES = [
        :corner_bottom_right,
        :corner_top_right,
        :corner_top_left,
        :corner_bottom_left,
        :divider_left,
        :divider_up,
        :divider_down,
        :divider_right,
        :line,
        :pipe,
        :cross
      ].freeze

      def self.parse(border)
        case border
        when Hash
          new(border)
        when *TTY::Box::BOX_CHARS.keys
          new(type: border)
        else
          raise ArgumentError,
                "Wrong value `#{border}` for :border configuration option"
        end
      end

      attr_reader :type, :top, :top_left, :top_right, :left, :right,
                  :bottom, :bottom_left, :bottom_right

      alias top? top
      alias left? left
      alias right? right
      alias bottom? bottom
      alias top_left? top_left
      alias top_right? top_right
      alias bottom_left? bottom_left
      alias bottom_right? bottom_right

      def initialize(type: :light,
                     top: :line,
                     top_left: :corner_top_left,
                     top_right: :corner_top_right,
                     left: :pipe,
                     right: :pipe,
                     bottom: :line,
                     bottom_left: :corner_bottom_left,
                     bottom_right: :corner_bottom_right)

        @type         = type
        @top          = check_name(:top, top)
        @top_left     = check_name(:top_left, top_left)
        @top_right    = check_name(:top_right, top_right)
        @left         = check_name(:left, left)
        @right        = check_name(:right, right)
        @bottom       = check_name(:bottom, bottom)
        @bottom_left  = check_name(:bottom_left, bottom_left)
        @bottom_right = check_name(:bottom_right, bottom_right)
      end

      private

      # Check if border values name is allowed
      # @api private
      def check_name(key, value)
        unless (BORDER_VALUES.include?(:"#{value}") || [true, false].include?(value))
          raise ArgumentError, "Invalid border value: '#{value}' for #{key.inspect}"
        end
        value
      end
    end # Border
  end # Box
end # TTY
