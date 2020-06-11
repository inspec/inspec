# frozen_string_literal: true

module TTY
  class Prompt
    # Cross platform common Unicode symbols.
    #
    # @api public
    module Symbols
      KEYS = {
        tick: '✓',
        cross: '✘',
        star: '★',
        square: '◼',
        square_empty: '◻',
        dot: '•',
        bullet: '●',
        bullet_empty: '○',
        marker: '‣',
        line: '─',
        pipe: '|',
        ellipsis: '…',
        radio_on: '⬢',
        radio_off: '⬡',
        checkbox_on: '☒',
        checkbox_off: '☐',
        circle: '◯',
        circle_on: 'ⓧ',
        circle_off: 'Ⓘ',
        arrow_up: '↑',
        arrow_down: '↓',
        arrow_up_down: '↕',
        arrow_left: '←',
        arrow_right: '→',
        arrow_left_right: '↔',
        heart: '♥',
        diamond: '♦',
        club: '♣',
        spade: '♠'
      }.freeze

      WIN_KEYS = {
        tick: '√',
        cross: 'x',
        star: '*',
        square: '[█]',
        square_empty: '[ ]',
        dot: '.',
        bullet: 'O',
        bullet_empty: '○',
        marker: '>',
        line: '-',
        pipe: '|',
        ellipsis: '...',
        radio_on: '(*)',
        radio_off: '( )',
        checkbox_on: '[×]',
        checkbox_off: '[ ]',
        circle: '( )',
        circle_on: '(x)',
        circle_off: '( )',
        arrow_up: '↑',
        arrow_down: '↓',
        arrow_up_down: '↕',
        arrow_left: '←',
        arrow_right: '→',
        arrow_left_right: '↔',
        heart: '♥',
        diamond: '♦',
        club: '♣',
        spade: '♠'
      }.freeze

      def symbols
        @symbols ||= windows? ? WIN_KEYS : KEYS
      end
      module_function :symbols

      # Check if Windowz
      #
      # @return [Boolean]
      #
      # @api public
      def windows?
        ::File::ALT_SEPARATOR == "\\"
      end
      module_function :windows?
    end # Symbols
  end # Prompt
end # TTY
