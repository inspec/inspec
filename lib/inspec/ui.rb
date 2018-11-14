module Inspec
  # Provides simple UI interaction primitives for CLI commands and plugins.
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

    attr_reader :io

    def initialize(opts = {})
      @color = opts[:color].nil? ? true : opts[:color]
      @io = $stdout
    end

    def color?
      @color
    end

    # Low-level formatting methods
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

  end
end