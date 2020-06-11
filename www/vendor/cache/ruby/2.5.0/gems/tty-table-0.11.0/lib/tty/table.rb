# frozen_string_literal: true

require 'equatable'
require 'forwardable'
require 'necromancer'

require_relative 'table/columns'
require_relative 'table/header'
require_relative 'table/orientation'
require_relative 'table/row'
require_relative 'table/renderer'
require_relative 'table/transformation'
require_relative 'table/validatable'
require_relative 'table/version'

module TTY
  # A core class intended for storing data in a structured, tabular form.
  # Once the data is stored in a TTY::Table various operations can be performed
  # before the information is dumped into a stdout.
  class Table
    include Comparable, Enumerable, Validatable, Equatable
    extend Forwardable

    # The table header
    #
    # @return [Enumerable]
    #
    # @api public
    attr_reader :header

    # The table rows
    #
    # @return [Enumerable]
    #
    # @api private
    attr_reader :rows
    # private :rows

    # The table orientation out of :horizontal and :vertical
    #
    # @return [TTY::Table::Orientation]
    #
    # @api public
    attr_reader :orientation

    # The table original row count
    #
    # @return [Integer]
    #
    # @api public
    attr_reader :original_rows

    # The table original column count
    #
    # @return [Integer]
    #
    # @api public
    attr_reader :original_columns

    # Subset of safe methods that both Array and Hash implement
    def_delegators(:data, :assoc, :flatten, :include?, :index,
                   :length, :select, :to_a, :values_at, :pretty_print, :rassoc)

    # Create a new Table where each argument is a row
    #
    # @example
    #   table = TTY::Table[['a1', 'a2'], ['b1', 'b2']]
    #
    # @api public
    def self.[](*rows)
      new(rows: rows)
    end

    # Instantiate a new Table
    #
    # @example of no header
    #   table = Table.new [['a1', 'a2'], ['b1', 'b2']]
    #
    # @example of direct parameters
    #   rows  = [['a1', 'a2'], ['b1', 'b2']]
    #   table = Table.new ['Header 1', 'Header 2'], rows
    #
    # @example of parameters passed as options
    #   rows  = [['a1', 'a2'], ['b1', 'b2']]
    #   table = Table.new header: ['Header 1', 'Header 2'], rows: rows
    #
    # @example of parameters passed as hash
    #   Table.new [{'Header1' => ['a1','a2'], 'Header2' => ['b1', 'b2'] }]}
    #
    # @param [Array[Symbol], Hash] args
    #
    # @api public
    def self.new(*args, &block)
      options = args.last.respond_to?(:to_hash) ? args.pop : {}
      if args.size.nonzero?
        super(Transformation.extract_tuples(args).merge(options), &block)
      else
        super(options, &block)
      end
    end

    # Initialize a Table
    #
    # @param [Hash] options
    #   the options to create the table with
    # @option options [String] :header
    #   column names to be displayed
    # @option options [String] :rows
    #   Array of Arrays expressing the rows
    # @option options [Symbol] :orientation
    #   used to transform table orientation
    #
    # @return [TTY::Table]
    #
    # @api private
    def initialize(options = {}, &block)
      validate_options! options
      @converter     = Necromancer.new
      @header        = (value = options[:header]) ? Header.new(value) : nil
      @rows          = coerce(options.fetch(:rows) { Row.new([]) })
      @rotated       = false
      self.orientation = options.fetch(:orientation) { :horizontal }

      assert_row_sizes @rows
      orientation.transform(self)

      yield_or_eval(&block) if block_given?
    end

    # Provides a list of rows to have separations applied
    #
    # @return [Array]
    #
    # @api public
    def separators
      @separators ||= []
    end

    # Provides access to all table data
    #
    # @return [Array]
    #
    # @api public
    def data
      (header && !header.empty?) ? [header] + rows : rows
    end

    # Sets table orientation
    #
    # @param [String,Symbol] value
    #
    # @api public
    def orientation=(value)
      @orientation = Orientation.coerce(value)
    end

    # Marks this table as rotated
    #
    # @return [Boolean]
    #
    # @api public
    def rotated?
      @rotated
    end

    # Rotate the table between vertical and horizontal orientation
    #
    # @return [self]
    #
    # @api private
    def rotate
      orientation.transform(self)
      self
    end

    # Rotate the table vertically
    #
    # @api private
    def rotate_vertical
      @original_columns = columns_size
      @original_rows    = rows_size
      @rows             = orientation.slice(self)
      @header           = [] if header
      @rotated          = true
    end

    # Rotate the table horizontally
    #
    # @api private
    def rotate_horizontal
      return unless rotated?
      head, body = orientation.slice(self)
      if header && header.empty?
        @header = head[0]
        @rows   = body.map { |row| to_row(row, @header) }
      else
        @rows = body.map { |row| to_row(row) }
      end
    end

    # Lookup element of the table given a row(i) and column(j)
    #
    # @param [Integer] row_index
    # @param [Integer] column_index
    #
    # @example
    #   table = TTY::Table.new [['a1','a2'], ['b1','b2']]
    #   table[0]    # => ['a1','a2']
    #   table[0,0]  # => 'a1'
    #   table[-1]   # => ['b1','b2']
    #
    # @api public
    def [](row_index, column_index = false)
      return row(row_index) unless column_index
      if row_index >= 0 && column_index >= 0
        rows.fetch(row_index) { return nil }[column_index]
      else
        fail TTY::Table::TupleMissing.new(row_index, column_index)
      end
    end
    alias_method :at, :[]
    alias_method :element, :[]
    alias_method :component, :[]

    # Set table value at row(i) and column(j)
    #
    # @api private
    def []=(row_index, column_index, val)
      @rows[row_index][column_index] = val
    end
    private :[]=

    # Return a row number at the index of the table as an Array.
    # When a block is given, the elements of that Array are iterated over.
    #
    # @example
    #   rows  = [['a1', 'a2'], ['b1', 'b2']]
    #   table = TTY::Table.new rows: rows
    #   table.row(1) { |row| ... }
    #
    # @param [Integer] index
    #
    # @yield []
    #   optional block to execute in the iteration operation
    #
    # @return [self]
    #
    # @api public
    def row(index, &block)
      if block_given?
        rows.fetch(index) { return self }.each(&block)
        self
      else
        rows.fetch(index) { return nil }
      end
    end

    # Return a column number at the index of the table as an Array.
    # If the table has a header then column can be searched by header name.
    # When a block is given, the elements of that Array are iterated over.
    #
    # @example
    #   header = [:h1, :h2]
    #   rows  = [ ['a1', 'a2'], ['b1', 'b2'] ]
    #   table = TTY::Table.new :rows => rows, :header => header
    #   table.column(1)
    #   table.column(1)   { |element| ... }
    #   table.column(:h1)
    #   table.column(:h1) { |element| ... }
    #
    # @param [Integer, String, Symbol] index
    #
    # @yield []
    #   optional block to execute in the iteration operation
    #
    # @return [self]
    #
    # @api public
    def column(index)
      index_unknown = index.is_a?(Integer) && (index >= columns_size || index < 0)
      if block_given?
        return self if index_unknown
        rows.map { |row| yield row[index] }
      else
        return nil if index_unknown
        rows.map { |row| row[index] }.compact
      end
    end

    # Add row to table
    #
    # @param [Array] row
    #
    # @return [self]
    #
    # @api public
    def <<(row)
      if row == Border::SEPARATOR
        separators << columns_size - (header ? 0 : 2)
      else
        rows_copy = rows.dup
        assert_row_sizes rows_copy << row
        rows << to_row(row)
      end
      self
    end

    # Iterate over each tuple in the set
    #
    # @example
    #   table = TTY::Table.new(header, tuples)
    #   table.each { |row| ... }
    #
    # @yield [Array[Array]]
    #
    # @return [self]
    #
    # @api public
    def each
      return to_enum unless block_given?
      data.each { |row| yield row }
      self
    end

    # Same as #each but passes the index of the row with the row itself
    #
    # @example
    #   table = TTY::Table.new(header, tuples)
    #   table.each_with_index { |row, index|
    #     puts "#{row} at #{index}"
    #   }
    #
    # @return self
    #
    # @api public
    def each_with_index
      return to_enum unless block_given?
      start_index = -1
      data.each do |row|
        yield row.to_a, start_index += 1
      end
      self
    end

    # Return the number of columns
    #
    # @example
    #   table.columns_size # => 5
    #
    # @return [Integer]
    #
    # @api public
    def columns_size
      rows.size > 0 ? rows[0].size : 0
    end
    alias columns_count columns_size

    # Return the number of rows
    #
    # @example
    #   table.row_size # => 5
    #
    # @return [Integer]
    #
    # @api public
    def rows_size
      rows.size
    end

    # Return the number of rows and columns
    #
    # @example
    #   table.size # => [3,5]
    #
    # @return [Array] row x columns
    #
    # @api public
    def size
      [rows_size, columns_size]
    end

    # Check table width
    #
    # @return [Integer] width
    #
    # @api public
    def width
      Columns.total_width(data)
    end

    # Return true if this is an empty table, i.e. if the number of
    # rows or the number of columns is 0
    #
    # @return [Boolean]
    #
    # @api public
    def empty?
      columns_size == 0 || rows_size == 0
    end

    # Return string representation of table using basic renderer.
    #
    # @return [String]
    #
    # @api public
    def to_s
      render(:basic)
    end

    # Return renderer for this table
    #
    # @param [Symbol] type
    #   the renderer type
    #
    # @param [Hash] options
    #   the renderer options
    #
    def renderer(type = :basic, options = {})
      @renderer ||= Renderer.select(type).new(self, options)
    end

    # Render a given table. This method takes options which will be passed
    # to the renderer prior to rendering, which allows the caller to set any
    # table rendering variables.
    #
    # @param [Symbol] renderer_type
    #   the renderer to be used
    #
    # @param [Hash] options
    #
    # @yield [renderer]
    #
    # @yieldparam [TTY::Table::Renderer] renderer
    #   the renderer for the table
    #
    # @return [String]
    #
    # @api public
    def render(*args, &block)
      render_with(nil, *args, &block)
    end

    # Render a given table using custom border class.
    #
    # @param [TTY::Table::Border] border_class
    #
    # @param [Symbol] renderer_type
    #
    # @param [Hash] options
    #
    # @yield [renderer]
    #
    # @yieldparam [TTY::Table::Renderer] renderer
    #   the renderer for the table
    #
    # @return [String]
    #
    # @api public
    def render_with(border_class, renderer_type=(not_set=true), options={}, &block)
      unless not_set
        if renderer_type.respond_to?(:to_hash)
          options = renderer_type
        else
          options[:renderer] = renderer_type
        end
      end

      Renderer.render_with(border_class, self, options, &block)
    end

    # Coerce an Enumerable into a Table
    # This coercion mechanism is used by Table to handle Enumerable types
    # and force them into array type.
    #
    # @param [Enumerable] rows
    #    the object to coerce
    #
    # @return [Array]
    #
    # @api public
    def coerce(rows)
      coerced_rows = []
      @converter.convert(rows).to(:array).each do |row|
        if row == Border::SEPARATOR
          separators << coerced_rows.length - (header ? 0 : 1)
        else
          coerced_rows << to_row(row, header)
        end
      end
      coerced_rows
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
  end # Table
end # TTY
