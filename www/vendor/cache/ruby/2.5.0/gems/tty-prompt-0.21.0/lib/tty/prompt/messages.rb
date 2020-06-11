module TTY
  class Prompt
    class Messages

      def setup_messages
        @messages = {
          range?: 'Value %{value} must be within the range %{in}',
          valid?: 'Your answer is invalid (must match %{valid})',
          required?: 'Value must be provided'
        }
      end

      def initialize
        setup_messages
      end

      # Stores all the error messages displayed to user
      # The currently supported messages are:
      #  * :range?
      #  * :required?
      #  * :valid?
      attr_reader :messages

      def get(key)
        
      end

      # Retrieve message based on the key
      #
      # @param [Symbol] name
      #   the name of message key
      #
      # @param [Hash] tokens
      #   the tokens to evaluate
      #
      # @return [Array[String]]
      #
      # @api private
      def message_for(name, tokens = nil)
        template = @messages[name]
        if !template.match(/\%\{/).nil?
          [template % tokens]
        else
          [template]
        end
      end
    end
  end
end
