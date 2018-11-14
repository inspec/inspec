require 'text-table'

module Inspec
  # Provides simple terminal UI interaction primitives for CLI commands and plugins.
  class UI

    ANSI_CODES = {
      reset: '\e[0m',
      bold: '\e[1m',
      color: {
        red: '\e[38;5;9m',      # 256-color light red
        green: '\e[38;5;41m',  # 256-color light green
        yellow: '\e[33m',
        cyan: '\e[36m',
        white: '\e[37m',
        grey: '\e[38;5;247m',  # 256-color medium grey
      },
    }.freeze

    GLYPHS = {
      bullet: '•', # BULLET, Unicode: U+2022, UTF-8: E2 80 A2
      check: '✔', #  HEAVY CHECK MARK, Unicode: U+2714, UTF-8: E2 9C 94
      swirl: '↺', # ANTICLOCKWISE OPEN CIRCLE ARROW, Unicode U+21BA, UTF-8: E2 86 BA
      script_x: '×', # MULTIPLICATION SIGN, Unicode: U+00D7, UTF-8: C3 97
      question: '?', # normal ASCII question mark
      em_dash: '—', # EM DASH Unicode: U+2014, UTF-8: E2 80 94'
      heavy_dash: '≖', # RING IN EQUAL TO, Unicode: U+2256, UTF-8: E2 89 96
      vertical_dash: '|', # VERTICAL LINE, Unicode: U+007C, UTF-8: 7C
      table_corner: '⨀', # N-ARY CIRCLED DOT OPERATOR, Unicode: U+2A00, UTF-8: E2 A8 80
    }.freeze

    attr_reader :io

    def initialize(opts = {})
      @color = opts[:color].nil? ? true : opts[:color]
      @io = opts[:io] || $stdout
    end

    def color?
      @color
    end

    #=========================================================================#
    #                   Low-level formatting methods
    #=========================================================================#

    def plain(str)
      io.print(str)
    end

    def bold(str)
      color? ? io.print(ANSI_CODES[:bold] + str + ANSI_CODES[:reset]) : plain(str)
    end

    ANSI_CODES[:color].keys.each do |color|
      define_method(color) do |str|
        color? ? io.print(ANSI_CODES[:color][color] + str + ANSI_CODES[:reset]) : plain(str)
      end
    end

    #=========================================================================#
    #                   High-Level formatting methods
    #=========================================================================#

    def emphasis(str)
      cyan(str)
    end

    def headline(str)
      if str.length < 76
        dash_length = 80 - str.length - 4 # 4 spaces
        dash_length = dash_length / 2
      else
        dash_length = 0
      end

      result = "\n"
      result += ' ' + (color? ? GLYPHS[:em_dash] : '-') * dash_length + ' '
      result += color? ? ANSI_CODES[:bold] + ANSI_CODES[:color][:white] : ''
      result += str
      result += color? ? ANSI_CODES[:reset] : ''
      result += ' ' + (color? ? GLYPHS[:em_dash] : '-') * dash_length + ' '
      result += "\n\n"

      io.print result
    end

    # Issues a one-line message, with 'ERROR: ' prepended in bold red.
    def error(str)
      result = ''
      result += color? ? ANSI_CODES[:bold] + ANSI_CODES[:color][:red] : ''
      result += 'ERROR:'
      result += color? ? ANSI_CODES[:reset] : ''
      result += ' '
      result += str
      result += "\n"
      io.print result
    end

    # Issues a one-line message, with 'WARNING: ' prepended in bold yellow.
    def warning(str)
      result = ''
      result += color? ? ANSI_CODES[:bold] + ANSI_CODES[:color][:yellow] : ''
      result += 'WARNING:'
      result += color? ? ANSI_CODES[:reset] : ''
      result += ' '
      result += str
      result += "\n"
      io.print result
    end

    # Draws a horizontal line.
    def line
      if color?
        io.print ANSI_CODES[:bold] + GLYPHS[:heavy_dash] * 80 + ANSI_CODES[:reset] + "\n"
      else
        io.print '-' * 80 + "\n"
      end
    end

    # Makes a bullet point.
    def list_item(str)
      bullet = color? ? ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + GLYPHS[:bullet] + ANSI_CODES[:reset] : '*'
      io.print ' ' + bullet + ' ' + str + "\n"
    end

    # Makes a table.  Call with a block; block arg will be a Text::Table object.
    def table
      the_table = TableHelper.new(
        color: color?,
        vertical_boundary: (color? ? GLYPHS[:em_dash] : '-'),
        horizontal_boundary:  (color? ? GLYPHS[:vertical_dash] : '|'),
        boundary_intersection: (color? ? GLYPHS[:table_corner] : '+'),
      )
      yield(the_table)
      io.print(the_table.to_s)
    end

    # This class exists to apply formatting to the header row.
    class TableHelper < Text::Table
      def initialize(opts)
        @color = opts.delete(:color)
        super(opts)
      end

      def color?
        @color
      end

      def head=(row)
        row = row.dup.map do |label|
          if label.is_a?(String) && color?
            ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + label + ANSI_CODES[:reset]
          else
            label
          end
        end
        super(row)
      end
    end

  end
end