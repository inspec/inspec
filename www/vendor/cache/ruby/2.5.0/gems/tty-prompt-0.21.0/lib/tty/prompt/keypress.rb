# frozen_string_literal: true

require_relative 'question'
require_relative 'timer'

module TTY
  class Prompt
    class Keypress < Question
      # Create keypress question
      #
      # @param [Prompt] prompt
      # @param [Hash] options
      #
      # @api public
      def initialize(prompt, **options)
        super
        @echo    = options.fetch(:echo) { false }
        @keys    = options.fetch(:keys) { UndefinedSetting }
        @timeout = options.fetch(:timeout) { UndefinedSetting }
        @interval = options.fetch(:interval) {
          (@timeout != UndefinedSetting && @timeout < 1) ? @timeout : 1
        }
        @decimals = (@interval.to_s.split('.')[1] || []).size
        @countdown = @timeout
        time = timeout? ? Float(@timeout) : nil
        @timer = Timer.new(time, Float(@interval))

        @prompt.subscribe(self)
      end

      def countdown(value = (not_set = true))
        return @countdown if not_set
        @countdown = value
      end

      # Check if any specific keys are set
      def any_key?
        @keys == UndefinedSetting
      end

      # Check if timeout is set
      def timeout?
        @timeout != UndefinedSetting
      end

      def keypress(event)
        if any_key?
          @done = true
        elsif @keys.is_a?(Array) && @keys.include?(event.key.name)
          @done = true
        else
          @done = false
        end
      end

      def render_question
        header = super
        if timeout?
          header.gsub!(/:countdown/, format("%.#{@decimals}f", countdown))
        end
        header
      end

      def interval_handler(time)
        return if @done

        question = render_question
        line_size = question.size
        total_lines = @prompt.count_screen_lines(line_size)
        @prompt.print(refresh(question.lines.count, total_lines))
        countdown(time)
        @prompt.print(render_question)
      end

      def process_input(question)
        @prompt.print(render_question)

        @timer.on_tick do |time|
          interval_handler(time)
        end

        @timer.while_remaining do |remaining|
          break if @done
          @input = @prompt.read_keypress(nonblock: true)
        end
        countdown(0) unless @done

        @evaluator.(@input)
      end

      def refresh(lines, lines_to_clear)
        @prompt.clear_lines(lines)
      end
    end # Keypress
  end # Prompt
end # TTY
