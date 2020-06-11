# frozen_string_literal: true

require 'equatable'
require 'pastel'
require 'strings'

module TTY
  class Table
    # A class that represents a unique element in a table.
    #
    # Used internally by {Table::Header} and {Table::Row} to
    # define internal structure.
    #
    # @api private
    class Field
      include Equatable

      # The value inside the field
      #
      # @api public
      attr_reader :value

      # The formatted value inside the field used for display
      #
      # @api public
      attr_reader :content

      # The name for the value
      #
      # @api public
      attr_reader :name

      # The actual value
      #
      # @api public
      attr_writer :value

      # The formatted string
      #
      # @api public
      attr_writer :content

      # Number of columns this field spans. Defaults to 1.
      #
      # @api public
      attr_reader :colspan

      # Number of rows this field spans. Defaults to 1.
      #
      # @api public
      attr_reader :rowspan

      # The field alignment
      #
      # @api public
      attr_reader :alignment

      # Initialize a Field
      #
      # @example
      #   field = TTY::Table::Field.new 'a1'
      #   field.value  # => a1
      #
      # @example
      #   field = TTY::Table::Field.new value: 'a1'
      #   field.value  # => a1
      #
      # @example
      #   field = TTY::Table::Field.new value: 'a1', alignment: :center
      #   field.value     # => a1
      #   field.alignment # => :center
      #
      # @api private
      def initialize(value)
        @value, options = extract_options(value)
        @content = @value.to_s
        @width   = options[:width]
        @alignment = options.fetch(:alignment) { nil }
        @colspan = options.fetch(:colspan) { 1 }
        @rowspan = options.fetch(:rowspan) { 1 }
      end

      # Extract options and set value
      #
      # @api private
      def extract_options(value)
        if value.is_a?(Hash)
          options = value
          value = options.fetch(:value)
        else
          options = {}
        end
        [value, options]
      end

      # Reset to original value
      #
      # @api public
      def reset!
        @content = @value.to_s
      end

      # The content width
      #
      # @api public
      def width
        @width || Strings::Align.display_width(@content)
      end

      # Return number of lines this value spans.
      #
      # A distinction is being made between escaped and non-escaped strings.
      #
      # @return [Array[String]]
      #
      # @api public
      def lines
        escaped = content.scan(/(\\n|\\t|\\r)/)
        escaped.empty? ? content.split(/\n/, -1) : [content]
      end

      # If the string contains unescaped new lines then the longest token
      # deterimines the actual field length.
      #
      # @return [Integer]
      #
      # @api public
      def length
        (lines.map do |line|
          Strings::Align.display_width(line)
        end << 0).max
      end

      # Extract the number of lines this value spans
      #
      # @return [Integer]
      #
      # @api public
      def height
        lines.size
      end

      def chars
        content.chars
      end

      # Return field content
      #
      # @return [String]
      #
      # @api public
      def to_s
        content
      end
    end # Field
  end # Table
end # TTY
