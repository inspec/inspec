require 'tty-table'

module Inspec
  # Provides simple terminal UI interaction primitives for CLI commands and plugins.
  class UI

    ANSI_CODES = {
      reset: "\e[0m",
      bold: "\e[1m",
      color: {
        red: "\e[38;5;9m",      # 256-color light red
        green: "\e[38;5;41m",  # 256-color light green
        yellow: "\e[33m",
        cyan: "\e[36m",
        white: "\e[37m",
        grey: "\e[38;5;247m",  # 256-color medium grey
      },
    }.freeze

    GLYPHS = {
      bullet: '•', # BULLET, Unicode: U+2022, UTF-8: E2 80 A2
      check: '✔', #  HEAVY CHECK MARK, Unicode: U+2714, UTF-8: E2 9C 94
      swirl: '↺', # ANTICLOCKWISE OPEN CIRCLE ARROW, Unicode U+21BA, UTF-8: E2 86 BA
      script_x: '×', # MULTIPLICATION SIGN, Unicode: U+00D7, UTF-8: C3 97
      question: '?', # normal ASCII question mark
      em_dash: '─', # BOX DRAWINGS LIGHT HORIZONTAL Unicode: U+2500, UTF-8: E2 94 80
      heavy_dash: '≖', # RING IN EQUAL TO, Unicode: U+2256, UTF-8: E2 89 96
      vertical_dash: '│', # │ BOX DRAWINGS LIGHT VERTICAL, Unicode: U+2502, UTF-8: E2 94 82
      table_corner: '⨀', # N-ARY CIRCLED DOT OPERATOR, Unicode: U+2A00, UTF-8: E2 A8 80
    }.freeze

    EXIT_NORMAL = 0
    EXIT_USAGE_ERROR = 1
    EXIT_PLUGIN_ERROR = 2
    EXIT_FAILED_TESTS = 100
    EXIT_SKIPPED_TESTS = 101

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

    # Makes a table.  Call with a block; block arg will be a TTY::Table object, 
    # with an extension for setting the header.
    # Typical use:
    # ui.table do |t|
    #   t.header = ['Name', 'Rank', 'Cereal Number']
    #   t << ['Crunch', 'Captain', 1]
    #   t << ['', '', 1]
    #  end
    def table
      the_table = TableHelper.new
      yield(the_table)

      colorizer = Proc.new do |data, row, col|
        if color? && row == 0
          ANSI_CODES[:bold] + ANSI_CODES[:color][:white] + data + ANSI_CODES[:reset]
        else
          data
        end
      end
      render_mode = color? ? :unicode : :ascii
      padding = [0, 1, 0, 1] # T R B L
      io.print(the_table.render(render_mode, filter: colorizer, padding: padding) + "\n")
    end

    class TableHelper < TTY::Table
      def header=(ary)
        cells = ary.dup.map { |label| { value: label, alignment: :center} }
        @header = TTY::Table::Header.new(cells)
      end
    end

    #=========================================================================#
    #                        Exit Codes
    #=========================================================================#

    def exit(code_sym = :normal)
      expected_symbols = [:normal, :usage_error, :plugin_error, :failed_tests, :skipped_tests]
      # If it's a number, give them a pass for now.
      if code_sym.kind_of? Numeric
        code_int = code_sym
      else
        code_const = ('EXIT_' + code_sym.to_s.upcase).to_sym
        unless self.class.const_defined?(code_const)
          warning("Unrecognized exit constant #{code_const} - exit with code 1")
          exit(:usage_error)
        end
        code_int = self.class.const_get(code_const)
      end
      Kernel.exit(code_int)
    end
  end
end