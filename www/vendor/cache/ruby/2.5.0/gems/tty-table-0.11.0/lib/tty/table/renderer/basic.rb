# frozen_string_literal: true

require 'tty-screen'
require 'strings'

require_relative '../alignment_set'
require_relative '../border_dsl'
require_relative '../border_options'
require_relative '../border/null'
require_relative '../column_constraint'
require_relative '../columns'
require_relative '../header'
require_relative '../indentation'
require_relative '../operations'
require_relative '../operation/alignment'
require_relative '../operation/truncation'
require_relative '../operation/wrapped'
require_relative '../operation/filter'
require_relative '../operation/escape'
require_relative '../operation/padding'
require_relative '../validatable'

module TTY
  class Table
    module Renderer
      # Renders table without any border styles.
      #
      # @api private
      class Basic
        include TTY::Table::Validatable

        # Table border to be rendered
        #
        # @return [TTY::Table::Border]
        #
        # @api private
        attr_accessor :border_class

        # The table enforced column widths
        #
        # @return [Array]
        #
        # @api public
        attr_writer :column_widths

        # The table column alignments
        #
        # @return [Array]
        #
        # @api private
        attr_accessor :alignments

        # A callable object used for formatting field content
        #
        # @api public
        attr_accessor :filter

        # The table column span behaviour. When true the column's line breaks
        # cause the column to span multiple rows. By default set to false.
        #
        # @return [Boolean]
        #
        # @api public
        attr_accessor :multiline

        # The table indentation value
        #
        # @return [Integer]
        #
        # @api public
        attr_reader :indent

        # The table total width
        #
        # @return [Integer]
        #
        # @api public
        attr_accessor :width

        # The table resizing behaviour. If true the algorithm will
        # automatically expand or shrink table to fit the terminal
        # width or specified width. By default its false.
        #
        # @return [Integer]
        #
        # @api public
        attr_accessor :resize

        # The table padding settings
        #
        # @return [TTY::Table::Padder]
        #
        # @api public
        attr_reader :padding

        # Initialize a Renderer
        #
        # @param [Hash] options
        # @option options [String] :alignments
        #   used to format table individual column alignment
        # @option options [Hash[Symbol]] :border
        #   the border options
        # @option options [String] :column_widths
        #   used to format table individula column width
        # @option options [Integer] :indent
        #   indent the first column by indent value
        # @option options [Integer,Array] :padding
        #   add padding to table fields
        #
        # @return [TTY::Table::Renderer::Basic]
        #
        # @api private
        def initialize(table, options = {})
          @table         = assert_table_type(table)
          @multiline     = options.fetch(:multiline) { false }
          @border        = TTY::Table::BorderOptions.from(options.delete(:border))
          @column_widths = options.fetch(:column_widths, nil)
          alignment      = Array(options[:alignment]) * table.columns_size
          @alignments    = TTY::Table::AlignmentSet.new(options[:alignments] || alignment)
          @filter        = options.fetch(:filter) { proc { |val, _| val } }
          @width         = options.fetch(:width) { TTY::Screen.width }
          @border_class  = options.fetch(:border_class) { Border::Null }
          @indent        = options.fetch(:indent) { 0 }
          @resize        = options.fetch(:resize) { false }
          @padding       = Strings::Padder.parse(options[:padding])
        end

        # Parses supplied column widths, if not present
        # calculates natural widths.
        #
        # @return [Array[Integer]]
        #
        # @api public
        def column_widths
          @column_widths = Columns.widths_from(table, @column_widths)
        end

        # Store border characters, style and separator for the table rendering
        #
        # @param [Hash, Table::BorderOptions] options
        #
        # @yield [Table::BorderOptions]
        #   block representing border options
        #
        # @api public
        def border(options=(not_set=true), &block)
          @border = TTY::Table::BorderOptions.new unless @border
          if block_given?
            border_dsl = TTY::Table::BorderDSL.new(&block)
            @border = border_dsl.options
          elsif !not_set
            @border = TTY::Table::BorderOptions.from(options)
          end
          @border.separator ||= @table.separators unless @table.separators.empty?
          @border
        end
        alias_method :border=, :border

        # Change the value of indentation
        #
        # @param [Integer]
        #   the indentation value
        #
        # @api public
        def indent=(value)
          @indent = value
        end

        # Sets the output padding,
        #
        # @param [Integer] value
        #   the amount of padding, not allowed to be zero
        #
        # @api public
        def padding=(value)
          @padding = Strings::Padder.parse(value)
        end

        # Renders table as string with border
        #
        # @example
        #   renderer = TTY::Table::Renderer::Basic.new(table)
        #   renderer.render
        #
        # @return [String]
        #   the string representation of table
        #
        # @api public
        def render
          return if table.empty?

          operations = TTY::Table::Operations.new
          operations.add(:escape, Operation::Escape.new)
          operations.apply_to(table, :escape) unless multiline

          column_constraint = ColumnConstraint.new(table, self)
          @column_widths = column_constraint.enforce
          widths_without_padding = @column_widths.map do |_width|
                                    _width - padding.left - padding.right
                                  end
          create_operations(widths_without_padding).each do |op|
            operations.add(*op)
          end
          operations.apply_to(table, *select_operations)

          render_data.compact.join("\n")
        end

        # Select applicable operations for this table
        #
        # @api private
        def select_operations
          ops = []
          ops << :escape unless multiline
          ops << :alignment
          ops << (multiline ? :wrapping : :truncation)
          ops << :padding
          ops << :filter
        end

        # Initialize operations
        #
        # @return [Array[String, Operation]]
        #
        # @api private
        def create_operations(widths)
          [
            [:alignment,  Operation::Alignment.new(alignments, widths)],
            [:filter,     Operation::Filter.new(filter)],
            [:truncation, Operation::Truncation.new(widths)],
            [:wrapping,   Operation::Wrapped.new(widths)],
            [:padding,    Operation::Padding.new(padding)]
          ]
        end

        protected

        # Table to be rendered
        #
        # @return [TTY::Table]
        #
        # @api public
        attr_reader :table

        # Render table data
        #
        # @api private
        def render_data
          first_row        = table.first
          data_border      = border_class.new(column_widths, border)
          header           = render_header(first_row, data_border)
          rows_with_border = render_rows(data_border)
          bottom_line      = data_border.bottom_line

          bottom_line = Indentation.indent(bottom_line, @indent) if bottom_line

          [header, rows_with_border, bottom_line].compact
        end

        # Format the header if present
        #
        # @param [TTY::Table::Row, TTY::Table::Header] row
        #   the first row in the table
        #
        # @param [TTY::Table::Border] data_border
        #   the border for this table
        #
        # @return [String]
        #
        # @api private
        def render_header(row, data_border)
          top_line = data_border.top_line
          return top_line unless row.is_a?(TTY::Table::Header)
          separator = data_border.separator if !border.separator || border.separator?(0)
          header = [top_line, data_border.row_line(row), separator]
          Indentation.indent(header.compact, @indent)
        end

        # Format the rows
        #
        # @param [TTY::Table::Border] data_border
        #   the border for this table
        #
        # @return [Arrays[String]]
        #
        # @api private
        def render_rows(data_border)
          rows = table.rows
          size = rows.size
          offset = table.first.is_a?(TTY::Table::Header) ? 1 : 0
          rows.each_with_index.map do |row, index|
            render_row(row, index+offset, data_border, size != (index + 1))
          end
        end

        # Format a single row with border
        #
        # @param [Array] row
        #   a row to decorate
        #
        # @param [TTY::Table::Border] data_border
        #   the border for this table
        #
        # @param [Boolean] is_not_last_row
        #
        # @api private
        def render_row(row, index, data_border, is_not_last_row)
          separator = data_border.separator
          row_line  = data_border.row_line(row)
          line = if border.separator?(index) && is_not_last_row
                   [row_line, separator]
                 else
                   row_line
                 end
          Indentation.indent(line, @indent)
        end
      end # Basic
    end # Renderer
  end # Table
end # TTY
