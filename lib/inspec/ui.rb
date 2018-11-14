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
        white: '\e[37m',
        grey: '\e[38;5;247m',  # 256-color medium grey
      },
    }.freeze

    GLYPHS = {
      list_item: '•', # BULLET, Unicode: U+2022, UTF-8: E2 80 A2
      check: '✔', #  HEAVY CHECK MARK, Unicode: U+2714, UTF-8: E2 9C 94
      swirl: '↺', # ANTICLOCKWISE OPEN CIRCLE ARROW, Unicode U+21BA, UTF-8: E2 86 BA
      script_x: '×', # MULTIPLICATION SIGN, Unicode: U+00D7, UTF-8: C3 97
      question: '?', # normal ASCII question mark
      em_dash: '—', # EM DASH Unicode: U+2014, UTF-8: E2 80 94'
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

    def headline(str)
      if str.length < 76
        dash_length = 80 - str.length - 4 # 4 spaces
        dash_length = dash_length / 2
      else
        dash_length = 0
      end

      result = "\n\n"
      result += ' ' + (color? ? GLYPHS[:em_dash] : '-') * dash_length + ' '
      result += color? ? ANSI_CODES[:bold] + ANSI_CODES[:color][:white] : ''
      result += str
      result += color? ? ANSI_CODES[:reset] : ''
      result += ' ' + (color? ? GLYPHS[:em_dash] : '-') * dash_length + ' '
      result += "\n"

      io.print result
    end

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

  end
end