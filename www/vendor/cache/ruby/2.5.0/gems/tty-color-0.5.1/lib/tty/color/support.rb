# frozen_string_literal: true

module TTY
  module Color
    class Support
      SOURCES = %w[from_term from_tput from_env from_curses].freeze
      ENV_VARS = %w[COLORTERM ANSICON].freeze

      # Initialize a color support
      # @api public
      def initialize(env, options = {})
        @env = env
        @verbose = options.fetch(:verbose) { false }
      end

      # Detect if terminal supports color
      #
      # @return [Boolean]
      #   true when terminal supports color, false otherwise
      #
      # @api public
      def support?
        return false unless TTY::Color.tty?

        value = false
        SOURCES.each do |from_check|
          break if (value = public_send(from_check)) != NoValue
        end
        value == NoValue ? false : value
      end

      # Inspect environment $TERM variable for color support
      #
      # @api private
      def from_term
        case @env['TERM']
        when 'dumb' then false
        when /^screen|^xterm|^vt100|color|ansi|cygwin|linux/i then true
        else NoValue
        end
      end

      # Shell out to tput to check color support
      #
      # @api private
      def from_tput
        return NoValue if !TTY::Color.command?("tput colors")

        cmd = %q(tput colors 2>/dev/null)
        `#{cmd}`.to_i > 2
      rescue Errno::ENOENT
        NoValue
      end

      # Check if environment specifies color variables
      #
      # @api private
      def from_env
        ENV_VARS.any? { |key| @env.key?(key) } || NoValue
      end

      # Attempt to load curses to check color support
      #
      # @return [Boolean]
      #
      # @api private
      def from_curses(curses_class = nil)
        return NoValue if TTY::Color.windows?

        require 'curses'

        if defined?(Curses)
          curses_class ||= Curses
          curses_class.init_screen
          has_color = curses_class.has_colors?
          curses_class.close_screen
          return has_color
        end
        NoValue
      rescue LoadError
        warn 'no native curses support' if @verbose
        NoValue
      end
    end # Support
  end # Color
end # TTY
