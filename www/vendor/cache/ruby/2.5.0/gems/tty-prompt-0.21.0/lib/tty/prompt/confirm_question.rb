# frozen_string_literal: true

require_relative 'question'
require_relative 'utils'

module TTY
  class Prompt
    class ConfirmQuestion < Question
      # Create confirmation question
      #
      # @param [Hash] options
      # @option options [String] :suffix
      # @option options [String] :positive
      # @option options [String] :negative
      #
      # @api public
      def initialize(prompt, **options)
        super
        @suffix   = options.fetch(:suffix)   { UndefinedSetting }
        @positive = options.fetch(:positive) { UndefinedSetting }
        @negative = options.fetch(:negative) { UndefinedSetting }
      end

      def positive?
        @positive != UndefinedSetting
      end

      def negative?
        @negative != UndefinedSetting
      end

      def suffix?
        @suffix != UndefinedSetting
      end

      # Set question suffix
      #
      # @api public
      def suffix(value = (not_set = true))
        return @negative if not_set
        @suffix = value
      end

      # Set value for matching positive choice
      #
      # @api public
      def positive(value = (not_set = true))
        return @positive if not_set
        @positive = value
      end

      # Set value for matching negative choice
      #
      # @api public
      def negative(value = (not_set = true))
        return @negative if not_set
        @negative = value
      end

      def call(message, &block)
        return if Utils.blank?(message)
        @message = message
        block.call(self) if block
        setup_defaults
        render
      end

      # Render confirmation question
      #
      # @return [String]
      #
      # @api private
      def render_question
        header = "#{@prefix}#{message} "
        if !@done
          header += @prompt.decorate("(#{@suffix})", @help_color) + ' '
        else
          answer = convert_result(@input)
          label  = answer ? @positive : @negative
          header += @prompt.decorate(label, @active_color)
        end
        header << "\n" if @done
        header
      end

      protected

      # Decide how to handle input from user
      #
      # @api private
      def process_input(question)
        @input = read_input(question)
        if Utils.blank?(@input)
          @input = default ? positive : negative
        end
        @evaluator.call(@input)
      end

      # @api private
      def setup_defaults
        @convert = conversion
        return if suffix? && positive?

        if suffix? && (!positive? || !negative?)
          parts = @suffix.split('/')
          @positive = parts[0]
          @negative = parts[1]
        elsif !suffix? && positive?
          @suffix = create_suffix
        else
          create_default_labels
        end
      end

      # @api private
      def create_default_labels
        @suffix   = default ? 'Y/n' : 'y/N'
        @positive = default ? 'Yes' : 'yes'
        @negative = default ? 'no' : 'No'
        @validation = /^(y(es)?|no?)$/i
        @messages[:valid?] = "Invalid input."
      end

      # @api private
      def create_suffix
        (default ? positive.capitalize : positive.downcase) + '/' +
          (default ? negative.downcase : negative.capitalize)
      end

      # Create custom conversion
      #
      # @api private
      def conversion
        proc { |input|
          positive_word   = Regexp.escape(positive)
          positive_letter = Regexp.escape(positive[0])
          pattern = Regexp.new("^#{positive_word}|#{positive_letter}$", true)
          !input.match(pattern).nil?
        }
      end
    end # ConfirmQuestion
  end # Prompt
end # TTY
